// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) {
  return _Portfolio.fromJson(json);
}

/// @nodoc
mixin _$Portfolio {
  Result get result => throw _privateConstructorUsedError;
  PortfolioData get data => throw _privateConstructorUsedError;

  /// Serializes this Portfolio to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioCopyWith<Portfolio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioCopyWith<$Res> {
  factory $PortfolioCopyWith(Portfolio value, $Res Function(Portfolio) then) =
      _$PortfolioCopyWithImpl<$Res, Portfolio>;
  @useResult
  $Res call({Result result, PortfolioData data});

  $ResultCopyWith<$Res> get result;
  $PortfolioDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PortfolioCopyWithImpl<$Res, $Val extends Portfolio>
    implements $PortfolioCopyWith<$Res> {
  _$PortfolioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? result = null, Object? data = null}) {
    return _then(
      _value.copyWith(
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as Result,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as PortfolioData,
          )
          as $Val,
    );
  }

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res> get result {
    return $ResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PortfolioDataCopyWith<$Res> get data {
    return $PortfolioDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PortfolioImplCopyWith<$Res>
    implements $PortfolioCopyWith<$Res> {
  factory _$$PortfolioImplCopyWith(
    _$PortfolioImpl value,
    $Res Function(_$PortfolioImpl) then,
  ) = __$$PortfolioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result result, PortfolioData data});

  @override
  $ResultCopyWith<$Res> get result;
  @override
  $PortfolioDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PortfolioImplCopyWithImpl<$Res>
    extends _$PortfolioCopyWithImpl<$Res, _$PortfolioImpl>
    implements _$$PortfolioImplCopyWith<$Res> {
  __$$PortfolioImplCopyWithImpl(
    _$PortfolioImpl _value,
    $Res Function(_$PortfolioImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? result = null, Object? data = null}) {
    return _then(
      _$PortfolioImpl(
        result: null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as Result,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as PortfolioData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioImpl implements _Portfolio {
  const _$PortfolioImpl({required this.result, required this.data});

  factory _$PortfolioImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioImplFromJson(json);

  @override
  final Result result;
  @override
  final PortfolioData data;

  @override
  String toString() {
    return 'Portfolio(result: $result, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, data);

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioImplCopyWith<_$PortfolioImpl> get copyWith =>
      __$$PortfolioImplCopyWithImpl<_$PortfolioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioImplToJson(this);
  }
}

abstract class _Portfolio implements Portfolio {
  const factory _Portfolio({
    required final Result result,
    required final PortfolioData data,
  }) = _$PortfolioImpl;

  factory _Portfolio.fromJson(Map<String, dynamic> json) =
      _$PortfolioImpl.fromJson;

  @override
  Result get result;
  @override
  PortfolioData get data;

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioImplCopyWith<_$PortfolioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String get message => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;

  /// Serializes this Result to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call({String message, int code});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
    _$ResultImpl value,
    $Res Function(_$ResultImpl) then,
  ) = __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int code});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
    _$ResultImpl _value,
    $Res Function(_$ResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = null}) {
    return _then(
      _$ResultImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  const _$ResultImpl({required this.message, required this.code});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  final String message;
  @override
  final int code;

  @override
  String toString() {
    return 'Result(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultImplToJson(this);
  }
}

abstract class _Result implements Result {
  const factory _Result({
    required final String message,
    required final int code,
  }) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  String get message;
  @override
  int get code;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PortfolioData _$PortfolioDataFromJson(Map<String, dynamic> json) {
  return _PortfolioData.fromJson(json);
}

/// @nodoc
mixin _$PortfolioData {
  List<Asset> get assetList => throw _privateConstructorUsedError;

  /// Serializes this PortfolioData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PortfolioData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioDataCopyWith<PortfolioData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDataCopyWith<$Res> {
  factory $PortfolioDataCopyWith(
    PortfolioData value,
    $Res Function(PortfolioData) then,
  ) = _$PortfolioDataCopyWithImpl<$Res, PortfolioData>;
  @useResult
  $Res call({List<Asset> assetList});
}

/// @nodoc
class _$PortfolioDataCopyWithImpl<$Res, $Val extends PortfolioData>
    implements $PortfolioDataCopyWith<$Res> {
  _$PortfolioDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortfolioData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? assetList = null}) {
    return _then(
      _value.copyWith(
            assetList: null == assetList
                ? _value.assetList
                : assetList // ignore: cast_nullable_to_non_nullable
                      as List<Asset>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PortfolioDataImplCopyWith<$Res>
    implements $PortfolioDataCopyWith<$Res> {
  factory _$$PortfolioDataImplCopyWith(
    _$PortfolioDataImpl value,
    $Res Function(_$PortfolioDataImpl) then,
  ) = __$$PortfolioDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Asset> assetList});
}

/// @nodoc
class __$$PortfolioDataImplCopyWithImpl<$Res>
    extends _$PortfolioDataCopyWithImpl<$Res, _$PortfolioDataImpl>
    implements _$$PortfolioDataImplCopyWith<$Res> {
  __$$PortfolioDataImplCopyWithImpl(
    _$PortfolioDataImpl _value,
    $Res Function(_$PortfolioDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? assetList = null}) {
    return _then(
      _$PortfolioDataImpl(
        assetList: null == assetList
            ? _value._assetList
            : assetList // ignore: cast_nullable_to_non_nullable
                  as List<Asset>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioDataImpl implements _PortfolioData {
  const _$PortfolioDataImpl({required final List<Asset> assetList})
    : _assetList = assetList;

  factory _$PortfolioDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioDataImplFromJson(json);

  final List<Asset> _assetList;
  @override
  List<Asset> get assetList {
    if (_assetList is EqualUnmodifiableListView) return _assetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetList);
  }

  @override
  String toString() {
    return 'PortfolioData(assetList: $assetList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDataImpl &&
            const DeepCollectionEquality().equals(
              other._assetList,
              _assetList,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_assetList));

  /// Create a copy of PortfolioData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioDataImplCopyWith<_$PortfolioDataImpl> get copyWith =>
      __$$PortfolioDataImplCopyWithImpl<_$PortfolioDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioDataImplToJson(this);
  }
}

abstract class _PortfolioData implements PortfolioData {
  const factory _PortfolioData({required final List<Asset> assetList}) =
      _$PortfolioDataImpl;

  factory _PortfolioData.fromJson(Map<String, dynamic> json) =
      _$PortfolioDataImpl.fromJson;

  @override
  List<Asset> get assetList;

  /// Create a copy of PortfolioData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioDataImplCopyWith<_$PortfolioDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
