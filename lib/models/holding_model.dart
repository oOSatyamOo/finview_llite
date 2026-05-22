import 'package:freezed_annotation/freezed_annotation.dart';

part 'holding_model.freezed.dart';
part 'holding_model.g.dart';

@freezed
abstract class HoldingModel with _$HoldingModel {
  const factory HoldingModel({
    required String symbol,
    required String name,
    required int units,
    @JsonKey(name: 'avg_cost') required double avgCost,
    @JsonKey(name: 'current_price') required double currentPrice,
  }) = _HoldingModel;

  factory HoldingModel.fromJson(Map<String, dynamic> json) => _$HoldingModelFromJson(json);
}

// Extension to calculate value and gains
extension HoldingModelExtension on HoldingModel {
  double get totalValue => units * currentPrice;
  double get totalCost => units * avgCost;
  double get totalGain => totalValue - totalCost;
  double get gainPercentage => totalCost > 0 ? (totalGain / totalCost) * 100 : 0.0;
}
