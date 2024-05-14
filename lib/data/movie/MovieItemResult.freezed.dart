// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MovieItemResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieItemResult _$MovieItemResultFromJson(Map<String, dynamic> json) {
  return _MovieItemResult.fromJson(json);
}

/// @nodoc
mixin _$MovieItemResult {
  @JsonKey(name: 'id')
  String get contentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'record_key')
  String get recordKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_time')
  int get totalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'mp4_url')
  String get movieMP4Url => throw _privateConstructorUsedError;
  @JsonKey(name: 'm3u8_url')
  String get movieHLSUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'preview_time')
  int get previewTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtitle_group_count')
  int get pageByPageMaxCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_content')
  ContentsBaseResult? get nextContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtitle')
  List<CaptionInformationResult> get captionList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieItemResultCopyWith<MovieItemResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieItemResultCopyWith<$Res> {
  factory $MovieItemResultCopyWith(
          MovieItemResult value, $Res Function(MovieItemResult) then) =
      _$MovieItemResultCopyWithImpl<$Res, MovieItemResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String contentID,
      @JsonKey(name: 'record_key') String recordKey,
      @JsonKey(name: 'total_time') int totalTime,
      @JsonKey(name: 'mp4_url') String movieMP4Url,
      @JsonKey(name: 'm3u8_url') String movieHLSUrl,
      @JsonKey(name: 'preview_time') int previewTime,
      @JsonKey(name: 'subtitle_group_count') int pageByPageMaxCount,
      @JsonKey(name: 'next_content') ContentsBaseResult? nextContent,
      @JsonKey(name: 'subtitle') List<CaptionInformationResult> captionList});

  $ContentsBaseResultCopyWith<$Res>? get nextContent;
}

/// @nodoc
class _$MovieItemResultCopyWithImpl<$Res, $Val extends MovieItemResult>
    implements $MovieItemResultCopyWith<$Res> {
  _$MovieItemResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentID = null,
    Object? recordKey = null,
    Object? totalTime = null,
    Object? movieMP4Url = null,
    Object? movieHLSUrl = null,
    Object? previewTime = null,
    Object? pageByPageMaxCount = null,
    Object? nextContent = freezed,
    Object? captionList = null,
  }) {
    return _then(_value.copyWith(
      contentID: null == contentID
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as String,
      recordKey: null == recordKey
          ? _value.recordKey
          : recordKey // ignore: cast_nullable_to_non_nullable
              as String,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as int,
      movieMP4Url: null == movieMP4Url
          ? _value.movieMP4Url
          : movieMP4Url // ignore: cast_nullable_to_non_nullable
              as String,
      movieHLSUrl: null == movieHLSUrl
          ? _value.movieHLSUrl
          : movieHLSUrl // ignore: cast_nullable_to_non_nullable
              as String,
      previewTime: null == previewTime
          ? _value.previewTime
          : previewTime // ignore: cast_nullable_to_non_nullable
              as int,
      pageByPageMaxCount: null == pageByPageMaxCount
          ? _value.pageByPageMaxCount
          : pageByPageMaxCount // ignore: cast_nullable_to_non_nullable
              as int,
      nextContent: freezed == nextContent
          ? _value.nextContent
          : nextContent // ignore: cast_nullable_to_non_nullable
              as ContentsBaseResult?,
      captionList: null == captionList
          ? _value.captionList
          : captionList // ignore: cast_nullable_to_non_nullable
              as List<CaptionInformationResult>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentsBaseResultCopyWith<$Res>? get nextContent {
    if (_value.nextContent == null) {
      return null;
    }

    return $ContentsBaseResultCopyWith<$Res>(_value.nextContent!, (value) {
      return _then(_value.copyWith(nextContent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieItemResultImplCopyWith<$Res>
    implements $MovieItemResultCopyWith<$Res> {
  factory _$$MovieItemResultImplCopyWith(_$MovieItemResultImpl value,
          $Res Function(_$MovieItemResultImpl) then) =
      __$$MovieItemResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String contentID,
      @JsonKey(name: 'record_key') String recordKey,
      @JsonKey(name: 'total_time') int totalTime,
      @JsonKey(name: 'mp4_url') String movieMP4Url,
      @JsonKey(name: 'm3u8_url') String movieHLSUrl,
      @JsonKey(name: 'preview_time') int previewTime,
      @JsonKey(name: 'subtitle_group_count') int pageByPageMaxCount,
      @JsonKey(name: 'next_content') ContentsBaseResult? nextContent,
      @JsonKey(name: 'subtitle') List<CaptionInformationResult> captionList});

  @override
  $ContentsBaseResultCopyWith<$Res>? get nextContent;
}

/// @nodoc
class __$$MovieItemResultImplCopyWithImpl<$Res>
    extends _$MovieItemResultCopyWithImpl<$Res, _$MovieItemResultImpl>
    implements _$$MovieItemResultImplCopyWith<$Res> {
  __$$MovieItemResultImplCopyWithImpl(
      _$MovieItemResultImpl _value, $Res Function(_$MovieItemResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentID = null,
    Object? recordKey = null,
    Object? totalTime = null,
    Object? movieMP4Url = null,
    Object? movieHLSUrl = null,
    Object? previewTime = null,
    Object? pageByPageMaxCount = null,
    Object? nextContent = freezed,
    Object? captionList = null,
  }) {
    return _then(_$MovieItemResultImpl(
      contentID: null == contentID
          ? _value.contentID
          : contentID // ignore: cast_nullable_to_non_nullable
              as String,
      recordKey: null == recordKey
          ? _value.recordKey
          : recordKey // ignore: cast_nullable_to_non_nullable
              as String,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as int,
      movieMP4Url: null == movieMP4Url
          ? _value.movieMP4Url
          : movieMP4Url // ignore: cast_nullable_to_non_nullable
              as String,
      movieHLSUrl: null == movieHLSUrl
          ? _value.movieHLSUrl
          : movieHLSUrl // ignore: cast_nullable_to_non_nullable
              as String,
      previewTime: null == previewTime
          ? _value.previewTime
          : previewTime // ignore: cast_nullable_to_non_nullable
              as int,
      pageByPageMaxCount: null == pageByPageMaxCount
          ? _value.pageByPageMaxCount
          : pageByPageMaxCount // ignore: cast_nullable_to_non_nullable
              as int,
      nextContent: freezed == nextContent
          ? _value.nextContent
          : nextContent // ignore: cast_nullable_to_non_nullable
              as ContentsBaseResult?,
      captionList: null == captionList
          ? _value._captionList
          : captionList // ignore: cast_nullable_to_non_nullable
              as List<CaptionInformationResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieItemResultImpl implements _MovieItemResult {
  _$MovieItemResultImpl(
      {@JsonKey(name: 'id') this.contentID = "",
      @JsonKey(name: 'record_key') this.recordKey = "",
      @JsonKey(name: 'total_time') this.totalTime = 0,
      @JsonKey(name: 'mp4_url') this.movieMP4Url = "",
      @JsonKey(name: 'm3u8_url') this.movieHLSUrl = "",
      @JsonKey(name: 'preview_time') this.previewTime = 0,
      @JsonKey(name: 'subtitle_group_count') this.pageByPageMaxCount = 0,
      @JsonKey(name: 'next_content') this.nextContent,
      @JsonKey(name: 'subtitle')
      final List<CaptionInformationResult> captionList = const []})
      : _captionList = captionList;

  factory _$MovieItemResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieItemResultImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String contentID;
  @override
  @JsonKey(name: 'record_key')
  final String recordKey;
  @override
  @JsonKey(name: 'total_time')
  final int totalTime;
  @override
  @JsonKey(name: 'mp4_url')
  final String movieMP4Url;
  @override
  @JsonKey(name: 'm3u8_url')
  final String movieHLSUrl;
  @override
  @JsonKey(name: 'preview_time')
  final int previewTime;
  @override
  @JsonKey(name: 'subtitle_group_count')
  final int pageByPageMaxCount;
  @override
  @JsonKey(name: 'next_content')
  final ContentsBaseResult? nextContent;
  final List<CaptionInformationResult> _captionList;
  @override
  @JsonKey(name: 'subtitle')
  List<CaptionInformationResult> get captionList {
    if (_captionList is EqualUnmodifiableListView) return _captionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_captionList);
  }

  @override
  String toString() {
    return 'MovieItemResult(contentID: $contentID, recordKey: $recordKey, totalTime: $totalTime, movieMP4Url: $movieMP4Url, movieHLSUrl: $movieHLSUrl, previewTime: $previewTime, pageByPageMaxCount: $pageByPageMaxCount, nextContent: $nextContent, captionList: $captionList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieItemResultImpl &&
            (identical(other.contentID, contentID) ||
                other.contentID == contentID) &&
            (identical(other.recordKey, recordKey) ||
                other.recordKey == recordKey) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.movieMP4Url, movieMP4Url) ||
                other.movieMP4Url == movieMP4Url) &&
            (identical(other.movieHLSUrl, movieHLSUrl) ||
                other.movieHLSUrl == movieHLSUrl) &&
            (identical(other.previewTime, previewTime) ||
                other.previewTime == previewTime) &&
            (identical(other.pageByPageMaxCount, pageByPageMaxCount) ||
                other.pageByPageMaxCount == pageByPageMaxCount) &&
            (identical(other.nextContent, nextContent) ||
                other.nextContent == nextContent) &&
            const DeepCollectionEquality()
                .equals(other._captionList, _captionList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contentID,
      recordKey,
      totalTime,
      movieMP4Url,
      movieHLSUrl,
      previewTime,
      pageByPageMaxCount,
      nextContent,
      const DeepCollectionEquality().hash(_captionList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieItemResultImplCopyWith<_$MovieItemResultImpl> get copyWith =>
      __$$MovieItemResultImplCopyWithImpl<_$MovieItemResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieItemResultImplToJson(
      this,
    );
  }
}

abstract class _MovieItemResult implements MovieItemResult {
  factory _MovieItemResult(
          {@JsonKey(name: 'id') final String contentID,
          @JsonKey(name: 'record_key') final String recordKey,
          @JsonKey(name: 'total_time') final int totalTime,
          @JsonKey(name: 'mp4_url') final String movieMP4Url,
          @JsonKey(name: 'm3u8_url') final String movieHLSUrl,
          @JsonKey(name: 'preview_time') final int previewTime,
          @JsonKey(name: 'subtitle_group_count') final int pageByPageMaxCount,
          @JsonKey(name: 'next_content') final ContentsBaseResult? nextContent,
          @JsonKey(name: 'subtitle')
          final List<CaptionInformationResult> captionList}) =
      _$MovieItemResultImpl;

  factory _MovieItemResult.fromJson(Map<String, dynamic> json) =
      _$MovieItemResultImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get contentID;
  @override
  @JsonKey(name: 'record_key')
  String get recordKey;
  @override
  @JsonKey(name: 'total_time')
  int get totalTime;
  @override
  @JsonKey(name: 'mp4_url')
  String get movieMP4Url;
  @override
  @JsonKey(name: 'm3u8_url')
  String get movieHLSUrl;
  @override
  @JsonKey(name: 'preview_time')
  int get previewTime;
  @override
  @JsonKey(name: 'subtitle_group_count')
  int get pageByPageMaxCount;
  @override
  @JsonKey(name: 'next_content')
  ContentsBaseResult? get nextContent;
  @override
  @JsonKey(name: 'subtitle')
  List<CaptionInformationResult> get captionList;
  @override
  @JsonKey(ignore: true)
  _$$MovieItemResultImplCopyWith<_$MovieItemResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
