import 'package:freezed_annotation/freezed_annotation.dart';
import 'holding_model.dart';

part 'portfolio_summary_model.freezed.dart';
part 'portfolio_summary_model.g.dart';

@freezed
abstract class PortfolioSummaryModel with _$PortfolioSummaryModel {
  const factory PortfolioSummaryModel({
    required String user,
    @JsonKey(name: 'portfolio_value') required double portfolioValue,
    @JsonKey(name: 'total_gain') required double totalGain,
    @Default([]) List<HoldingModel> holdings,
  }) = _PortfolioSummaryModel;

  factory PortfolioSummaryModel.fromJson(Map<String, dynamic> json) => _$PortfolioSummaryModelFromJson(json);
}
