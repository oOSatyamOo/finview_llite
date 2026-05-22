import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:finview_lite/controllers/portfolio_controller.dart';
import 'dart:convert';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Mock the asset loading
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (ByteData? message) async {
      final String jsonStr = '''
      {
        "user": "Aarav Patel",
        "portfolio_value": 1000.0,
        "total_gain": 100.0,
        "holdings": [
          {
            "symbol": "AAPL",
            "name": "Apple Inc.",
            "units": 10,
            "avg_cost": 100.0,
            "current_price": 150.0
          },
          {
            "symbol": "TSLA",
            "name": "Tesla Inc.",
            "units": 5,
            "avg_cost": 200.0,
            "current_price": 180.0
          }
        ]
      }
      ''';
      return const StringCodec().encodeMessage(jsonStr);
    });
  });

  group('PortfolioController Tests', () {
    late PortfolioController controller;

    setUp(() {
      controller = PortfolioController();
      Get.put(controller);
    });

    tearDown(() {
      Get.delete<PortfolioController>();
    });

    test('Initial state is correct', () {
      expect(controller.isLoading.value, true);
      expect(controller.error.value, null);
      expect(controller.portfolio.value, null);
    });

    test('loadPortfolio fetches and parses data correctly', () async {
      await controller.loadPortfolio();
      
      expect(controller.isLoading.value, false);
      expect(controller.portfolio.value, isNotNull);
      expect(controller.holdings.length, 2);
      // Sorted by value descending initially
      // AAPL value = 1500, TSLA value = 900
      expect(controller.holdings[0].symbol, 'AAPL'); 
    });

    test('toggleReturnFormat switches formats', () {
      expect(controller.returnFormat.value, ReturnFormat.percentage);
      controller.toggleReturnFormat();
      expect(controller.returnFormat.value, ReturnFormat.absolute);
      controller.toggleReturnFormat();
      expect(controller.returnFormat.value, ReturnFormat.percentage);
    });

    test('Sorting by name works', () async {
      await controller.loadPortfolio();
      controller.setSortType(SortType.name);
      
      expect(controller.holdings[0].symbol, 'AAPL');
      expect(controller.holdings[1].symbol, 'TSLA');
    });

    test('Sorting by gain works', () async {
      await controller.loadPortfolio();
      controller.setSortType(SortType.gain);
      
      // AAPL gain = 50 * 10 = 500
      // TSLA gain = -20 * 5 = -100
      expect(controller.holdings[0].symbol, 'AAPL');
      expect(controller.holdings[1].symbol, 'TSLA');
    });
  });
}
