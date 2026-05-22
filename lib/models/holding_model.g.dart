// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HoldingModel _$HoldingModelFromJson(Map<String, dynamic> json) =>
    _HoldingModel(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      units: (json['units'] as num).toInt(),
      avgCost: (json['avg_cost'] as num).toDouble(),
      currentPrice: (json['current_price'] as num).toDouble(),
    );

Map<String, dynamic> _$HoldingModelToJson(_HoldingModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'units': instance.units,
      'avg_cost': instance.avgCost,
      'current_price': instance.currentPrice,
    };
