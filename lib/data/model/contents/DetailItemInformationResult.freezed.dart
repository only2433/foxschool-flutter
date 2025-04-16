// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DetailItemInformationResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailItemInformationResult _$DetailItemInformationResultFromJson(
    Map<String, dynamic> json) {
  return _DetailItemInformationResult.fromJson(json);
}

/// @nodoc
mixin _$DetailItemInformationResult {
  @JsonKey(name: 'latest_study')
  String get lastStudyContentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'list')
  List<ContentsBaseResult> get contentsList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'info')
  SeriesInformation? get seriesInformation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailItemInformationResultCopyWith<DetailItemInformationResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailItemInformationResultCopyWith<$Res> {
  factory $DetailItemInformationResultCopyWith(
          DetailItemInformationResult value,
          $Res Function(DetailItemInformationResult) then) =
      _$DetailItemInformationResultCopyWithImpl<$Res,
          DetailItemInformationResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'latest_study') String lastStudyContentID,
      @JsonKey(name: 'list') List<ContentsBaseResult> contentsList,
      @JsonKey(name: 'info') SeriesInformation? seriesInformation});

  $SeriesInformationCopyWith<$Res>? get seriesInformation;
}

/// @nodoc
class _$DetailItemInformationResultCopyWithImpl<$Res,
        $Val extends DetailItemInformationResult>
    implements $DetailItemInformationResultCopyWith<$Res> {
  _$DetailItemInformationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastStudyContentID = null,
    Object? contentsList = null,
    Object? seriesInformation = freezed,
  }) {
    return _then(_value.copyWith(
      lastStudyContentID: null == lastStudyContentID
          ? _value.lastStudyContentID
          : lastStudyContentID // ignore: cast_nullable_to_non_nullable
              as String,
      contentsList: null == contentsList
          ? _value.contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
      seriesInformation: freezed == seriesInformation
          ? _value.seriesInformation
          : seriesInformation // ignore: cast_nullable_to_non_nullable
              as SeriesInformation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SeriesInformationCopyWith<$Res>? get seriesInformation {
    if (_value.seriesInformation == null) {
      return null;
    }

    return $SeriesInformationCopyWith<$Res>(_value.seriesInformation!, (value) {
      return _then(_value.copyWith(seriesInformation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailItemInformationResultImplCopyWith<$Res>
    implements $DetailItemInformationResultCopyWith<$Res> {
  factory _$$DetailItemInformationResultImplCopyWith(
          _$DetailItemInformationResultImpl value,
          $Res Function(_$DetailItemInformationResultImpl) then) =
      __$$DetailItemInformationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'latest_study') String lastStudyContentID,
      @JsonKey(name: 'list') List<ContentsBaseResult> contentsList,
      @JsonKey(name: 'info') SeriesInformation? seriesInformation});

  @override
  $SeriesInformationCopyWith<$Res>? get seriesInformation;
}

/// @nodoc
class __$$DetailItemInformationResultImplCopyWithImpl<$Res>
    extends _$DetailItemInformationResultCopyWithImpl<$Res,
        _$DetailItemInformationResultImpl>
    implements _$$DetailItemInformationResultImplCopyWith<$Res> {
  __$$DetailItemInformationResultImplCopyWithImpl(
      _$DetailItemInformationResultImpl _value,
      $Res Function(_$DetailItemInformationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastStudyContentID = null,
    Object? contentsList = null,
    Object? seriesInformation = freezed,
  }) {
    return _then(_$DetailItemInformationResultImpl(
      lastStudyContentID: null == lastStudyContentID
          ? _value.lastStudyContentID
          : lastStudyContentID // ignore: cast_nullable_to_non_nullable
              as String,
      contentsList: null == contentsList
          ? _value._contentsList
          : contentsList // ignore: cast_nullable_to_non_nullable
              as List<ContentsBaseResult>,
      seriesInformation: freezed == seriesInformation
          ? _value.seriesInformation
          : seriesInformation // ignore: cast_nullable_to_non_nullable
              as SeriesInformation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailItemInformationResultImpl extends _DetailItemInformationResult {
  _$DetailItemInformationResultImpl(
      {@JsonKey(name: 'latest_study') this.lastStudyContentID = "",
      @JsonKey(name: 'list')
      final List<ContentsBaseResult> contentsList = const [],
      @JsonKey(name: 'info') this.seriesInformation})
      : _contentsList = contentsList,
        super._();

  factory _$DetailItemInformationResultImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DetailItemInformationResultImplFromJson(json);

  @override
  @JsonKey(name: 'latest_study')
  final String lastStudyContentID;
  final List<ContentsBaseResult> _contentsList;
  @override
  @JsonKey(name: 'list')
  List<ContentsBaseResult> get contentsList {
    if (_contentsList is EqualUnmodifiableListView) return _contentsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentsList);
  }

  @override
  @JsonKey(name: 'info')
  final SeriesInformation? seriesInformation;

  @override
  String toString() {
    return 'DetailItemInformationResult(lastStudyContentID: $lastStudyContentID, contentsList: $contentsList, seriesInformation: $seriesInformation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailItemInformationResultImpl &&
            (identical(other.lastStudyContentID, lastStudyContentID) ||
                other.lastStudyContentID == lastStudyContentID) &&
            const DeepCollectionEquality()
                .equals(other._contentsList, _contentsList) &&
            (identical(other.seriesInformation, seriesInformation) ||
                other.seriesInformation == seriesInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastStudyContentID,
      const DeepCollectionEquality().hash(_contentsList), seriesInformation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailItemInformationResultImplCopyWith<_$DetailItemInformationResultImpl>
      get copyWith => __$$DetailItemInformationResultImplCopyWithImpl<
          _$DetailItemInformationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailItemInformationResultImplToJson(
      this,
    );
  }
}

abstract class _DetailItemInformationResult
    extends DetailItemInformationResult {
  factory _DetailItemInformationResult(
          {@JsonKey(name: 'latest_study') final String lastStudyContentID,
          @JsonKey(name: 'list') final List<ContentsBaseResult> contentsList,
          @JsonKey(name: 'info') final SeriesInformation? seriesInformation}) =
      _$DetailItemInformationResultImpl;
  _DetailItemInformationResult._() : super._();

  factory _DetailItemInformationResult.fromJson(Map<String, dynamic> json) =
      _$DetailItemInformationResultImpl.fromJson;

  @override
  @JsonKey(name: 'latest_study')
  String get lastStudyContentID;
  @override
  @JsonKey(name: 'list')
  List<ContentsBaseResult> get contentsList;
  @override
  @JsonKey(name: 'info')
  SeriesInformation? get seriesInformation;
  @override
  @JsonKey(ignore: true)
  _$$DetailItemInformationResultImplCopyWith<_$DetailItemInformationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
