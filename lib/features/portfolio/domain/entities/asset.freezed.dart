// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  String get securitySymbol => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get securityName => throw _privateConstructorUsedError;
  String get securityDescription => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get ratio => throw _privateConstructorUsedError;

  /// Serializes this Asset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call({
    String securitySymbol,
    String type,
    String securityName,
    String securityDescription,
    int quantity,
    double ratio,
  });
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? securitySymbol = null,
    Object? type = null,
    Object? securityName = null,
    Object? securityDescription = null,
    Object? quantity = null,
    Object? ratio = null,
  }) {
    return _then(
      _value.copyWith(
            securitySymbol: null == securitySymbol
                ? _value.securitySymbol
                : securitySymbol // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            securityName: null == securityName
                ? _value.securityName
                : securityName // ignore: cast_nullable_to_non_nullable
                      as String,
            securityDescription: null == securityDescription
                ? _value.securityDescription
                : securityDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            ratio: null == ratio
                ? _value.ratio
                : ratio // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
    _$AssetImpl value,
    $Res Function(_$AssetImpl) then,
  ) = __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String securitySymbol,
    String type,
    String securityName,
    String securityDescription,
    int quantity,
    double ratio,
  });
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$AssetCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
    _$AssetImpl _value,
    $Res Function(_$AssetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? securitySymbol = null,
    Object? type = null,
    Object? securityName = null,
    Object? securityDescription = null,
    Object? quantity = null,
    Object? ratio = null,
  }) {
    return _then(
      _$AssetImpl(
        securitySymbol: null == securitySymbol
            ? _value.securitySymbol
            : securitySymbol // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        securityName: null == securityName
            ? _value.securityName
            : securityName // ignore: cast_nullable_to_non_nullable
                  as String,
        securityDescription: null == securityDescription
            ? _value.securityDescription
            : securityDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        ratio: null == ratio
            ? _value.ratio
            : ratio // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl({
    required this.securitySymbol,
    required this.type,
    required this.securityName,
    required this.securityDescription,
    required this.quantity,
    required this.ratio,
  });

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final String securitySymbol;
  @override
  final String type;
  @override
  final String securityName;
  @override
  final String securityDescription;
  @override
  final int quantity;
  @override
  final double ratio;

  @override
  String toString() {
    return 'Asset(securitySymbol: $securitySymbol, type: $type, securityName: $securityName, securityDescription: $securityDescription, quantity: $quantity, ratio: $ratio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.securitySymbol, securitySymbol) ||
                other.securitySymbol == securitySymbol) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.securityName, securityName) ||
                other.securityName == securityName) &&
            (identical(other.securityDescription, securityDescription) ||
                other.securityDescription == securityDescription) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.ratio, ratio) || other.ratio == ratio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    securitySymbol,
    type,
    securityName,
    securityDescription,
    quantity,
    ratio,
  );

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetImplToJson(this);
  }
}

abstract class _Asset implements Asset {
  const factory _Asset({
    required final String securitySymbol,
    required final String type,
    required final String securityName,
    required final String securityDescription,
    required final int quantity,
    required final double ratio,
  }) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  String get securitySymbol;
  @override
  String get type;
  @override
  String get securityName;
  @override
  String get securityDescription;
  @override
  int get quantity;
  @override
  double get ratio;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
