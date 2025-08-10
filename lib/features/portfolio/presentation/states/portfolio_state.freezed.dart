// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PortfolioState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Asset> assets) loaded,
    required TResult Function(Failure failure) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Asset> assets)? loaded,
    TResult? Function(Failure failure)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Asset> assets)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioInitial value) initial,
    required TResult Function(PortfolioLoading value) loading,
    required TResult Function(PortfolioLoaded value) loaded,
    required TResult Function(PortfolioError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioInitial value)? initial,
    TResult? Function(PortfolioLoading value)? loading,
    TResult? Function(PortfolioLoaded value)? loaded,
    TResult? Function(PortfolioError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioInitial value)? initial,
    TResult Function(PortfolioLoading value)? loading,
    TResult Function(PortfolioLoaded value)? loaded,
    TResult Function(PortfolioError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioStateCopyWith<$Res> {
  factory $PortfolioStateCopyWith(
    PortfolioState value,
    $Res Function(PortfolioState) then,
  ) = _$PortfolioStateCopyWithImpl<$Res, PortfolioState>;
}

/// @nodoc
class _$PortfolioStateCopyWithImpl<$Res, $Val extends PortfolioState>
    implements $PortfolioStateCopyWith<$Res> {
  _$PortfolioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PortfolioInitialImplCopyWith<$Res> {
  factory _$$PortfolioInitialImplCopyWith(
    _$PortfolioInitialImpl value,
    $Res Function(_$PortfolioInitialImpl) then,
  ) = __$$PortfolioInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioInitialImplCopyWithImpl<$Res>
    extends _$PortfolioStateCopyWithImpl<$Res, _$PortfolioInitialImpl>
    implements _$$PortfolioInitialImplCopyWith<$Res> {
  __$$PortfolioInitialImplCopyWithImpl(
    _$PortfolioInitialImpl _value,
    $Res Function(_$PortfolioInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PortfolioInitialImpl implements PortfolioInitial {
  const _$PortfolioInitialImpl();

  @override
  String toString() {
    return 'PortfolioState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PortfolioInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Asset> assets) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Asset> assets)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Asset> assets)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioInitial value) initial,
    required TResult Function(PortfolioLoading value) loading,
    required TResult Function(PortfolioLoaded value) loaded,
    required TResult Function(PortfolioError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioInitial value)? initial,
    TResult? Function(PortfolioLoading value)? loading,
    TResult? Function(PortfolioLoaded value)? loaded,
    TResult? Function(PortfolioError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioInitial value)? initial,
    TResult Function(PortfolioLoading value)? loading,
    TResult Function(PortfolioLoaded value)? loaded,
    TResult Function(PortfolioError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PortfolioInitial implements PortfolioState {
  const factory PortfolioInitial() = _$PortfolioInitialImpl;
}

/// @nodoc
abstract class _$$PortfolioLoadingImplCopyWith<$Res> {
  factory _$$PortfolioLoadingImplCopyWith(
    _$PortfolioLoadingImpl value,
    $Res Function(_$PortfolioLoadingImpl) then,
  ) = __$$PortfolioLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PortfolioLoadingImplCopyWithImpl<$Res>
    extends _$PortfolioStateCopyWithImpl<$Res, _$PortfolioLoadingImpl>
    implements _$$PortfolioLoadingImplCopyWith<$Res> {
  __$$PortfolioLoadingImplCopyWithImpl(
    _$PortfolioLoadingImpl _value,
    $Res Function(_$PortfolioLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PortfolioLoadingImpl implements PortfolioLoading {
  const _$PortfolioLoadingImpl();

  @override
  String toString() {
    return 'PortfolioState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PortfolioLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Asset> assets) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Asset> assets)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Asset> assets)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioInitial value) initial,
    required TResult Function(PortfolioLoading value) loading,
    required TResult Function(PortfolioLoaded value) loaded,
    required TResult Function(PortfolioError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioInitial value)? initial,
    TResult? Function(PortfolioLoading value)? loading,
    TResult? Function(PortfolioLoaded value)? loaded,
    TResult? Function(PortfolioError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioInitial value)? initial,
    TResult Function(PortfolioLoading value)? loading,
    TResult Function(PortfolioLoaded value)? loaded,
    TResult Function(PortfolioError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PortfolioLoading implements PortfolioState {
  const factory PortfolioLoading() = _$PortfolioLoadingImpl;
}

/// @nodoc
abstract class _$$PortfolioLoadedImplCopyWith<$Res> {
  factory _$$PortfolioLoadedImplCopyWith(
    _$PortfolioLoadedImpl value,
    $Res Function(_$PortfolioLoadedImpl) then,
  ) = __$$PortfolioLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Asset> assets});
}

/// @nodoc
class __$$PortfolioLoadedImplCopyWithImpl<$Res>
    extends _$PortfolioStateCopyWithImpl<$Res, _$PortfolioLoadedImpl>
    implements _$$PortfolioLoadedImplCopyWith<$Res> {
  __$$PortfolioLoadedImplCopyWithImpl(
    _$PortfolioLoadedImpl _value,
    $Res Function(_$PortfolioLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? assets = null}) {
    return _then(
      _$PortfolioLoadedImpl(
        null == assets
            ? _value._assets
            : assets // ignore: cast_nullable_to_non_nullable
                  as List<Asset>,
      ),
    );
  }
}

/// @nodoc

class _$PortfolioLoadedImpl implements PortfolioLoaded {
  const _$PortfolioLoadedImpl(final List<Asset> assets) : _assets = assets;

  final List<Asset> _assets;
  @override
  List<Asset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'PortfolioState.loaded(assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioLoadedImpl &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_assets));

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioLoadedImplCopyWith<_$PortfolioLoadedImpl> get copyWith =>
      __$$PortfolioLoadedImplCopyWithImpl<_$PortfolioLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Asset> assets) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Asset> assets)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Asset> assets)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioInitial value) initial,
    required TResult Function(PortfolioLoading value) loading,
    required TResult Function(PortfolioLoaded value) loaded,
    required TResult Function(PortfolioError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioInitial value)? initial,
    TResult? Function(PortfolioLoading value)? loading,
    TResult? Function(PortfolioLoaded value)? loaded,
    TResult? Function(PortfolioError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioInitial value)? initial,
    TResult Function(PortfolioLoading value)? loading,
    TResult Function(PortfolioLoaded value)? loaded,
    TResult Function(PortfolioError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PortfolioLoaded implements PortfolioState {
  const factory PortfolioLoaded(final List<Asset> assets) =
      _$PortfolioLoadedImpl;

  List<Asset> get assets;

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioLoadedImplCopyWith<_$PortfolioLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortfolioErrorImplCopyWith<$Res> {
  factory _$$PortfolioErrorImplCopyWith(
    _$PortfolioErrorImpl value,
    $Res Function(_$PortfolioErrorImpl) then,
  ) = __$$PortfolioErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$PortfolioErrorImplCopyWithImpl<$Res>
    extends _$PortfolioStateCopyWithImpl<$Res, _$PortfolioErrorImpl>
    implements _$$PortfolioErrorImplCopyWith<$Res> {
  __$$PortfolioErrorImplCopyWithImpl(
    _$PortfolioErrorImpl _value,
    $Res Function(_$PortfolioErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? failure = null}) {
    return _then(
      _$PortfolioErrorImpl(
        null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure,
      ),
    );
  }

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$PortfolioErrorImpl implements PortfolioError {
  const _$PortfolioErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PortfolioState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioErrorImplCopyWith<_$PortfolioErrorImpl> get copyWith =>
      __$$PortfolioErrorImplCopyWithImpl<_$PortfolioErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Asset> assets) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Asset> assets)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Asset> assets)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PortfolioInitial value) initial,
    required TResult Function(PortfolioLoading value) loading,
    required TResult Function(PortfolioLoaded value) loaded,
    required TResult Function(PortfolioError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PortfolioInitial value)? initial,
    TResult? Function(PortfolioLoading value)? loading,
    TResult? Function(PortfolioLoaded value)? loaded,
    TResult? Function(PortfolioError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PortfolioInitial value)? initial,
    TResult Function(PortfolioLoading value)? loading,
    TResult Function(PortfolioLoaded value)? loaded,
    TResult Function(PortfolioError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PortfolioError implements PortfolioState {
  const factory PortfolioError(final Failure failure) = _$PortfolioErrorImpl;

  Failure get failure;

  /// Create a copy of PortfolioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioErrorImplCopyWith<_$PortfolioErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
