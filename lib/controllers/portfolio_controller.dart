import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../core/error/failures.dart';
import '../models/holding_model.dart';
import '../models/portfolio_summary_model.dart';

enum SortType { name, value, gain }
enum ReturnFormat { percentage, absolute }

class PortfolioController extends GetxController {
  final Rx<PortfolioSummaryModel?> portfolio = Rx<PortfolioSummaryModel?>(null);
  final RxList<HoldingModel> holdings = <HoldingModel>[].obs;
  
  final RxBool isLoading = true.obs;
  final Rx<Failure?> error = Rx<Failure?>(null);

  final Rx<SortType> currentSort = SortType.value.obs;
  final Rx<ReturnFormat> returnFormat = ReturnFormat.percentage.obs;

  @override
  void onInit() {
    super.onInit();
    loadPortfolio();
  }

  Future<void> loadPortfolio() async {
    try {
      isLoading.value = true;
      error.value = null;
      
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      final String jsonString = await rootBundle.loadString('assets/portfolio.json');
      final Map<String, dynamic> jsonResponse = json.decode(jsonString);
      
      portfolio.value = PortfolioSummaryModel.fromJson(jsonResponse);
      holdings.value = List<HoldingModel>.from(portfolio.value!.holdings);
      
      _applySort();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = ExceptionHandler.handle(e is Exception ? e : Exception(e.toString()));
    }
  }

  void toggleReturnFormat() {
    returnFormat.value = returnFormat.value == ReturnFormat.percentage 
        ? ReturnFormat.absolute 
        : ReturnFormat.percentage;
  }

  void setSortType(SortType type) {
    currentSort.value = type;
    _applySort();
  }

  void _applySort() {
    switch (currentSort.value) {
      case SortType.name:
        holdings.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortType.value:
        holdings.sort((a, b) => b.totalValue.compareTo(a.totalValue));
        break;
      case SortType.gain:
        holdings.sort((a, b) => b.totalGain.compareTo(a.totalGain));
        break;
    }
  }

  Future<void> refreshData() async {
    try {
      isLoading.value = true;
      error.value = null;
      
      // Simulate network delay for refresh
      await Future.delayed(const Duration(milliseconds: 800));
      
      if (portfolio.value != null) {
        final random = Random();
        final updatedHoldings = holdings.map((h) {
          // Random price change between -5% to +5%
          final factor = 1.0 + (random.nextDouble() * 0.10 - 0.05);
          return h.copyWith(currentPrice: h.currentPrice * factor);
        }).toList();
        
        holdings.value = updatedHoldings;
        
        // Recalculate portfolio total value and gain
        double newTotalValue = 0;
        double newTotalGain = 0;
        for (var h in updatedHoldings) {
          newTotalValue += h.totalValue;
          newTotalGain += h.totalGain;
        }
        
        portfolio.value = portfolio.value!.copyWith(
          holdings: updatedHoldings,
          portfolioValue: newTotalValue,
          totalGain: newTotalGain,
        );
        _applySort();
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = ExceptionHandler.handle(e is Exception ? e : Exception(e.toString()));
    }
  }
}
