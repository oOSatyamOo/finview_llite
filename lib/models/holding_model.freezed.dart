// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holding_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HoldingModel {

 String get symbol; String get name; int get units;@JsonKey(name: 'avg_cost') double get avgCost;@JsonKey(name: 'current_price') double get currentPrice;
/// Create a copy of HoldingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoldingModelCopyWith<HoldingModel> get copyWith => _$HoldingModelCopyWithImpl<HoldingModel>(this as HoldingModel, _$identity);

  /// Serializes this HoldingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoldingModel&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.units, units) || other.units == units)&&(identical(other.avgCost, avgCost) || other.avgCost == avgCost)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,units,avgCost,currentPrice);

@override
String toString() {
  return 'HoldingModel(symbol: $symbol, name: $name, units: $units, avgCost: $avgCost, currentPrice: $currentPrice)';
}


}

/// @nodoc
abstract mixin class $HoldingModelCopyWith<$Res>  {
  factory $HoldingModelCopyWith(HoldingModel value, $Res Function(HoldingModel) _then) = _$HoldingModelCopyWithImpl;
@useResult
$Res call({
 String symbol, String name, int units,@JsonKey(name: 'avg_cost') double avgCost,@JsonKey(name: 'current_price') double currentPrice
});




}
/// @nodoc
class _$HoldingModelCopyWithImpl<$Res>
    implements $HoldingModelCopyWith<$Res> {
  _$HoldingModelCopyWithImpl(this._self, this._then);

  final HoldingModel _self;
  final $Res Function(HoldingModel) _then;

/// Create a copy of HoldingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? units = null,Object? avgCost = null,Object? currentPrice = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,avgCost: null == avgCost ? _self.avgCost : avgCost // ignore: cast_nullable_to_non_nullable
as double,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HoldingModel].
extension HoldingModelPatterns on HoldingModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HoldingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HoldingModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HoldingModel value)  $default,){
final _that = this;
switch (_that) {
case _HoldingModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HoldingModel value)?  $default,){
final _that = this;
switch (_that) {
case _HoldingModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name,  int units, @JsonKey(name: 'avg_cost')  double avgCost, @JsonKey(name: 'current_price')  double currentPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HoldingModel() when $default != null:
return $default(_that.symbol,_that.name,_that.units,_that.avgCost,_that.currentPrice);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name,  int units, @JsonKey(name: 'avg_cost')  double avgCost, @JsonKey(name: 'current_price')  double currentPrice)  $default,) {final _that = this;
switch (_that) {
case _HoldingModel():
return $default(_that.symbol,_that.name,_that.units,_that.avgCost,_that.currentPrice);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name,  int units, @JsonKey(name: 'avg_cost')  double avgCost, @JsonKey(name: 'current_price')  double currentPrice)?  $default,) {final _that = this;
switch (_that) {
case _HoldingModel() when $default != null:
return $default(_that.symbol,_that.name,_that.units,_that.avgCost,_that.currentPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HoldingModel implements HoldingModel {
  const _HoldingModel({required this.symbol, required this.name, required this.units, @JsonKey(name: 'avg_cost') required this.avgCost, @JsonKey(name: 'current_price') required this.currentPrice});
  factory _HoldingModel.fromJson(Map<String, dynamic> json) => _$HoldingModelFromJson(json);

@override final  String symbol;
@override final  String name;
@override final  int units;
@override@JsonKey(name: 'avg_cost') final  double avgCost;
@override@JsonKey(name: 'current_price') final  double currentPrice;

/// Create a copy of HoldingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HoldingModelCopyWith<_HoldingModel> get copyWith => __$HoldingModelCopyWithImpl<_HoldingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HoldingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HoldingModel&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.units, units) || other.units == units)&&(identical(other.avgCost, avgCost) || other.avgCost == avgCost)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,units,avgCost,currentPrice);

@override
String toString() {
  return 'HoldingModel(symbol: $symbol, name: $name, units: $units, avgCost: $avgCost, currentPrice: $currentPrice)';
}


}

/// @nodoc
abstract mixin class _$HoldingModelCopyWith<$Res> implements $HoldingModelCopyWith<$Res> {
  factory _$HoldingModelCopyWith(_HoldingModel value, $Res Function(_HoldingModel) _then) = __$HoldingModelCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name, int units,@JsonKey(name: 'avg_cost') double avgCost,@JsonKey(name: 'current_price') double currentPrice
});




}
/// @nodoc
class __$HoldingModelCopyWithImpl<$Res>
    implements _$HoldingModelCopyWith<$Res> {
  __$HoldingModelCopyWithImpl(this._self, this._then);

  final _HoldingModel _self;
  final $Res Function(_HoldingModel) _then;

/// Create a copy of HoldingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? units = null,Object? avgCost = null,Object? currentPrice = null,}) {
  return _then(_HoldingModel(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as int,avgCost: null == avgCost ? _self.avgCost : avgCost // ignore: cast_nullable_to_non_nullable
as double,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
