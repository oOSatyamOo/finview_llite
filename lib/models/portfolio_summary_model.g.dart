// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioSummaryModel _$PortfolioSummaryModelFromJson(
  Map<String, dynamic> json,
) => _PortfolioSummaryModel(
  user: json['user'] as String,
  portfolioValue: (json['portfolio_value'] as num).toDouble(),
  totalGain: (json['total_gain'] as num).toDouble(),
  holdings:
      (json['holdings'] as List<dynamic>?)
          ?.map((e) => HoldingModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PortfolioSummaryModelToJson(
  _PortfolioSummaryModel instance,
) => <String, dynamic>{
  'user': instance.user,
  'portfolio_value': instance.portfolioValue,
  'total_gain': instance.totalGain,
  'holdings': instance.holdings,
};
