// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MetaDataPagingResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetaDataPagingResult _$MetaDataPagingResultFromJson(Map<String, dynamic> json) {
  return _MetaDataPagingResult.fromJson(json);
}

/// @nodoc
mixin _$MetaDataPagingResult {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_page')
  int get totalPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaDataPagingResultCopyWith<MetaDataPagingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataPagingResultCopyWith<$Res> {
  factory $MetaDataPagingResultCopyWith(MetaDataPagingResult value,
          $Res Function(MetaDataPagingResult) then) =
      _$MetaDataPagingResultCopyWithImpl<$Res, MetaDataPagingResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'total_page') int totalPage});
}

/// @nodoc
class _$MetaDataPagingResultCopyWithImpl<$Res,
        $Val extends MetaDataPagingResult>
    implements $MetaDataPagingResultCopyWith<$Res> {
  _$MetaDataPagingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? totalPage = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaDataPagingResultImplCopyWith<$Res>
    implements $MetaDataPagingResultCopyWith<$Res> {
  factory _$$MetaDataPagingResultImplCopyWith(_$MetaDataPagingResultImpl value,
          $Res Function(_$MetaDataPagingResultImpl) then) =
      __$$MetaDataPagingResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'total_page') int totalPage});
}

/// @nodoc
class __$$MetaDataPagingResultImplCopyWithImpl<$Res>
    extends _$MetaDataPagingResultCopyWithImpl<$Res, _$MetaDataPagingResultImpl>
    implements _$$MetaDataPagingResultImplCopyWith<$Res> {
  __$$MetaDataPagingResultImplCopyWithImpl(_$MetaDataPagingResultImpl _value,
      $Res Function(_$MetaDataPagingResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? totalPage = null,
  }) {
    return _then(_$MetaDataPagingResultImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDataPagingResultImpl implements _MetaDataPagingResult {
  _$MetaDataPagingResultImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 0,
      @JsonKey(name: 'last_page') this.lastPage = 0,
      @JsonKey(name: 'per_page') this.perPage = 0,
      @JsonKey(name: 'total_page') this.totalPage = 0});

  factory _$MetaDataPagingResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataPagingResultImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey(name: 'total_page')
  final int totalPage;

  @override
  String toString() {
    return 'MetaDataPagingResult(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataPagingResultImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, totalPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataPagingResultImplCopyWith<_$MetaDataPagingResultImpl>
      get copyWith =>
          __$$MetaDataPagingResultImplCopyWithImpl<_$MetaDataPagingResultImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataPagingResultImplToJson(
      this,
    );
  }
}

abstract class _MetaDataPagingResult implements MetaDataPagingResult {
  factory _MetaDataPagingResult(
          {@JsonKey(name: 'current_page') final int currentPage,
          @JsonKey(name: 'last_page') final int lastPage,
          @JsonKey(name: 'per_page') final int perPage,
          @JsonKey(name: 'total_page') final int totalPage}) =
      _$MetaDataPagingResultImpl;

  factory _MetaDataPagingResult.fromJson(Map<String, dynamic> json) =
      _$MetaDataPagingResultImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  @JsonKey(name: 'total_page')
  int get totalPage;
  @override
  @JsonKey(ignore: true)
  _$$MetaDataPagingResultImplCopyWith<_$MetaDataPagingResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
