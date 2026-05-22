// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioSummaryModel {

 String get user;@JsonKey(name: 'portfolio_value') double get portfolioValue;@JsonKey(name: 'total_gain') double get totalGain; List<HoldingModel> get holdings;
/// Create a copy of PortfolioSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioSummaryModelCopyWith<PortfolioSummaryModel> get copyWith => _$PortfolioSummaryModelCopyWithImpl<PortfolioSummaryModel>(this as PortfolioSummaryModel, _$identity);

  /// Serializes this PortfolioSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioSummaryModel&&(identical(other.user, user) || other.user == user)&&(identical(other.portfolioValue, portfolioValue) || other.portfolioValue == portfolioValue)&&(identical(other.totalGain, totalGain) || other.totalGain == totalGain)&&const DeepCollectionEquality().equals(other.holdings, holdings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,portfolioValue,totalGain,const DeepCollectionEquality().hash(holdings));

@override
String toString() {
  return 'PortfolioSummaryModel(user: $user, portfolioValue: $portfolioValue, totalGain: $totalGain, holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class $PortfolioSummaryModelCopyWith<$Res>  {
  factory $PortfolioSummaryModelCopyWith(PortfolioSummaryModel value, $Res Function(PortfolioSummaryModel) _then) = _$PortfolioSummaryModelCopyWithImpl;
@useResult
$Res call({
 String user,@JsonKey(name: 'portfolio_value') double portfolioValue,@JsonKey(name: 'total_gain') double totalGain, List<HoldingModel> holdings
});




}
/// @nodoc
class _$PortfolioSummaryModelCopyWithImpl<$Res>
    implements $PortfolioSummaryModelCopyWith<$Res> {
  _$PortfolioSummaryModelCopyWithImpl(this._self, this._then);

  final PortfolioSummaryModel _self;
  final $Res Function(PortfolioSummaryModel) _then;

/// Create a copy of PortfolioSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? portfolioValue = null,Object? totalGain = null,Object? holdings = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,portfolioValue: null == portfolioValue ? _self.portfolioValue : portfolioValue // ignore: cast_nullable_to_non_nullable
as double,totalGain: null == totalGain ? _self.totalGain : totalGain // ignore: cast_nullable_to_non_nullable
as double,holdings: null == holdings ? _self.holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<HoldingModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioSummaryModel].
extension PortfolioSummaryModelPatterns on PortfolioSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String user, @JsonKey(name: 'portfolio_value')  double portfolioValue, @JsonKey(name: 'total_gain')  double totalGain,  List<HoldingModel> holdings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioSummaryModel() when $default != null:
return $default(_that.user,_that.portfolioValue,_that.totalGain,_that.holdings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String user, @JsonKey(name: 'portfolio_value')  double portfolioValue, @JsonKey(name: 'total_gain')  double totalGain,  List<HoldingModel> holdings)  $default,) {final _that = this;
switch (_that) {
case _PortfolioSummaryModel():
return $default(_that.user,_that.portfolioValue,_that.totalGain,_that.holdings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String user, @JsonKey(name: 'portfolio_value')  double portfolioValue, @JsonKey(name: 'total_gain')  double totalGain,  List<HoldingModel> holdings)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioSummaryModel() when $default != null:
return $default(_that.user,_that.portfolioValue,_that.totalGain,_that.holdings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioSummaryModel implements PortfolioSummaryModel {
  const _PortfolioSummaryModel({required this.user, @JsonKey(name: 'portfolio_value') required this.portfolioValue, @JsonKey(name: 'total_gain') required this.totalGain, final  List<HoldingModel> holdings = const []}): _holdings = holdings;
  factory _PortfolioSummaryModel.fromJson(Map<String, dynamic> json) => _$PortfolioSummaryModelFromJson(json);

@override final  String user;
@override@JsonKey(name: 'portfolio_value') final  double portfolioValue;
@override@JsonKey(name: 'total_gain') final  double totalGain;
 final  List<HoldingModel> _holdings;
@override@JsonKey() List<HoldingModel> get holdings {
  if (_holdings is EqualUnmodifiableListView) return _holdings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_holdings);
}


/// Create a copy of PortfolioSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioSummaryModelCopyWith<_PortfolioSummaryModel> get copyWith => __$PortfolioSummaryModelCopyWithImpl<_PortfolioSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioSummaryModel&&(identical(other.user, user) || other.user == user)&&(identical(other.portfolioValue, portfolioValue) || other.portfolioValue == portfolioValue)&&(identical(other.totalGain, totalGain) || other.totalGain == totalGain)&&const DeepCollectionEquality().equals(other._holdings, _holdings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,portfolioValue,totalGain,const DeepCollectionEquality().hash(_holdings));

@override
String toString() {
  return 'PortfolioSummaryModel(user: $user, portfolioValue: $portfolioValue, totalGain: $totalGain, holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class _$PortfolioSummaryModelCopyWith<$Res> implements $PortfolioSummaryModelCopyWith<$Res> {
  factory _$PortfolioSummaryModelCopyWith(_PortfolioSummaryModel value, $Res Function(_PortfolioSummaryModel) _then) = __$PortfolioSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String user,@JsonKey(name: 'portfolio_value') double portfolioValue,@JsonKey(name: 'total_gain') double totalGain, List<HoldingModel> holdings
});




}
/// @nodoc
class __$PortfolioSummaryModelCopyWithImpl<$Res>
    implements _$PortfolioSummaryModelCopyWith<$Res> {
  __$PortfolioSummaryModelCopyWithImpl(this._self, this._then);

  final _PortfolioSummaryModel _self;
  final $Res Function(_PortfolioSummaryModel) _then;

/// Create a copy of PortfolioSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? portfolioValue = null,Object? totalGain = null,Object? holdings = null,}) {
  return _then(_PortfolioSummaryModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,portfolioValue: null == portfolioValue ? _self.portfolioValue : portfolioValue // ignore: cast_nullable_to_non_nullable
as double,totalGain: null == totalGain ? _self.totalGain : totalGain // ignore: cast_nullable_to_non_nullable
as double,holdings: null == holdings ? _self._holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<HoldingModel>,
  ));
}


}

// dart format on
