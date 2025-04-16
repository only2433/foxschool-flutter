// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MainInformationResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainInformationResult _$MainInformationResultFromJson(
    Map<String, dynamic> json) {
  return _MainInformationResult.fromJson(json);
}

/// @nodoc
mixin _$MainInformationResult {
  @JsonKey(name: 'story')
  MainStoryInformationResult? get mainStoryInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'song')
  List<SeriesInformationResult> get mainSongInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'bookshelves')
  List<MyBookshelfResult> get bookshelfList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'vocabularies')
  List<MyVocabularyResult> get vocabularyList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'company_information')
  CompanyInformation? get companyInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'in_app_campaign')
  InAppCampaignResult? get inAppCampaign => throw _privateConstructorUsedError;
  String get homework => throw _privateConstructorUsedError;
  String get news => throw _privateConstructorUsedError;
  @JsonKey(name: 'files')
  FileInformationResult? get filesInformation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainInformationResultCopyWith<MainInformationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainInformationResultCopyWith<$Res> {
  factory $MainInformationResultCopyWith(MainInformationResult value,
          $Res Function(MainInformationResult) then) =
      _$MainInformationResultCopyWithImpl<$Res, MainInformationResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'story') MainStoryInformationResult? mainStoryInformation,
      @JsonKey(name: 'song') List<SeriesInformationResult> mainSongInformation,
      @JsonKey(name: 'bookshelves') List<MyBookshelfResult> bookshelfList,
      @JsonKey(name: 'vocabularies') List<MyVocabularyResult> vocabularyList,
      @JsonKey(name: 'company_information')
      CompanyInformation? companyInformation,
      @JsonKey(name: 'in_app_campaign') InAppCampaignResult? inAppCampaign,
      String homework,
      String news,
      @JsonKey(name: 'files') FileInformationResult? filesInformation});

  $MainStoryInformationResultCopyWith<$Res>? get mainStoryInformation;
  $CompanyInformationCopyWith<$Res>? get companyInformation;
  $InAppCampaignResultCopyWith<$Res>? get inAppCampaign;
  $FileInformationResultCopyWith<$Res>? get filesInformation;
}

/// @nodoc
class _$MainInformationResultCopyWithImpl<$Res,
        $Val extends MainInformationResult>
    implements $MainInformationResultCopyWith<$Res> {
  _$MainInformationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainStoryInformation = freezed,
    Object? mainSongInformation = null,
    Object? bookshelfList = null,
    Object? vocabularyList = null,
    Object? companyInformation = freezed,
    Object? inAppCampaign = freezed,
    Object? homework = null,
    Object? news = null,
    Object? filesInformation = freezed,
  }) {
    return _then(_value.copyWith(
      mainStoryInformation: freezed == mainStoryInformation
          ? _value.mainStoryInformation
          : mainStoryInformation // ignore: cast_nullable_to_non_nullable
              as MainStoryInformationResult?,
      mainSongInformation: null == mainSongInformation
          ? _value.mainSongInformation
          : mainSongInformation // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
      bookshelfList: null == bookshelfList
          ? _value.bookshelfList
          : bookshelfList // ignore: cast_nullable_to_non_nullable
              as List<MyBookshelfResult>,
      vocabularyList: null == vocabularyList
          ? _value.vocabularyList
          : vocabularyList // ignore: cast_nullable_to_non_nullable
              as List<MyVocabularyResult>,
      companyInformation: freezed == companyInformation
          ? _value.companyInformation
          : companyInformation // ignore: cast_nullable_to_non_nullable
              as CompanyInformation?,
      inAppCampaign: freezed == inAppCampaign
          ? _value.inAppCampaign
          : inAppCampaign // ignore: cast_nullable_to_non_nullable
              as InAppCampaignResult?,
      homework: null == homework
          ? _value.homework
          : homework // ignore: cast_nullable_to_non_nullable
              as String,
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as String,
      filesInformation: freezed == filesInformation
          ? _value.filesInformation
          : filesInformation // ignore: cast_nullable_to_non_nullable
              as FileInformationResult?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainStoryInformationResultCopyWith<$Res>? get mainStoryInformation {
    if (_value.mainStoryInformation == null) {
      return null;
    }

    return $MainStoryInformationResultCopyWith<$Res>(
        _value.mainStoryInformation!, (value) {
      return _then(_value.copyWith(mainStoryInformation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyInformationCopyWith<$Res>? get companyInformation {
    if (_value.companyInformation == null) {
      return null;
    }

    return $CompanyInformationCopyWith<$Res>(_value.companyInformation!,
        (value) {
      return _then(_value.copyWith(companyInformation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InAppCampaignResultCopyWith<$Res>? get inAppCampaign {
    if (_value.inAppCampaign == null) {
      return null;
    }

    return $InAppCampaignResultCopyWith<$Res>(_value.inAppCampaign!, (value) {
      return _then(_value.copyWith(inAppCampaign: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FileInformationResultCopyWith<$Res>? get filesInformation {
    if (_value.filesInformation == null) {
      return null;
    }

    return $FileInformationResultCopyWith<$Res>(_value.filesInformation!,
        (value) {
      return _then(_value.copyWith(filesInformation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainInformationResultImplCopyWith<$Res>
    implements $MainInformationResultCopyWith<$Res> {
  factory _$$MainInformationResultImplCopyWith(
          _$MainInformationResultImpl value,
          $Res Function(_$MainInformationResultImpl) then) =
      __$$MainInformationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'story') MainStoryInformationResult? mainStoryInformation,
      @JsonKey(name: 'song') List<SeriesInformationResult> mainSongInformation,
      @JsonKey(name: 'bookshelves') List<MyBookshelfResult> bookshelfList,
      @JsonKey(name: 'vocabularies') List<MyVocabularyResult> vocabularyList,
      @JsonKey(name: 'company_information')
      CompanyInformation? companyInformation,
      @JsonKey(name: 'in_app_campaign') InAppCampaignResult? inAppCampaign,
      String homework,
      String news,
      @JsonKey(name: 'files') FileInformationResult? filesInformation});

  @override
  $MainStoryInformationResultCopyWith<$Res>? get mainStoryInformation;
  @override
  $CompanyInformationCopyWith<$Res>? get companyInformation;
  @override
  $InAppCampaignResultCopyWith<$Res>? get inAppCampaign;
  @override
  $FileInformationResultCopyWith<$Res>? get filesInformation;
}

/// @nodoc
class __$$MainInformationResultImplCopyWithImpl<$Res>
    extends _$MainInformationResultCopyWithImpl<$Res,
        _$MainInformationResultImpl>
    implements _$$MainInformationResultImplCopyWith<$Res> {
  __$$MainInformationResultImplCopyWithImpl(_$MainInformationResultImpl _value,
      $Res Function(_$MainInformationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainStoryInformation = freezed,
    Object? mainSongInformation = null,
    Object? bookshelfList = null,
    Object? vocabularyList = null,
    Object? companyInformation = freezed,
    Object? inAppCampaign = freezed,
    Object? homework = null,
    Object? news = null,
    Object? filesInformation = freezed,
  }) {
    return _then(_$MainInformationResultImpl(
      mainStoryInformation: freezed == mainStoryInformation
          ? _value.mainStoryInformation
          : mainStoryInformation // ignore: cast_nullable_to_non_nullable
              as MainStoryInformationResult?,
      mainSongInformation: null == mainSongInformation
          ? _value._mainSongInformation
          : mainSongInformation // ignore: cast_nullable_to_non_nullable
              as List<SeriesInformationResult>,
      bookshelfList: null == bookshelfList
          ? _value._bookshelfList
          : bookshelfList // ignore: cast_nullable_to_non_nullable
              as List<MyBookshelfResult>,
      vocabularyList: null == vocabularyList
          ? _value._vocabularyList
          : vocabularyList // ignore: cast_nullable_to_non_nullable
              as List<MyVocabularyResult>,
      companyInformation: freezed == companyInformation
          ? _value.companyInformation
          : companyInformation // ignore: cast_nullable_to_non_nullable
              as CompanyInformation?,
      inAppCampaign: freezed == inAppCampaign
          ? _value.inAppCampaign
          : inAppCampaign // ignore: cast_nullable_to_non_nullable
              as InAppCampaignResult?,
      homework: null == homework
          ? _value.homework
          : homework // ignore: cast_nullable_to_non_nullable
              as String,
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as String,
      filesInformation: freezed == filesInformation
          ? _value.filesInformation
          : filesInformation // ignore: cast_nullable_to_non_nullable
              as FileInformationResult?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainInformationResultImpl implements _MainInformationResult {
  _$MainInformationResultImpl(
      {@JsonKey(name: 'story') this.mainStoryInformation,
      @JsonKey(name: 'song')
      final List<SeriesInformationResult> mainSongInformation = const [],
      @JsonKey(name: 'bookshelves')
      final List<MyBookshelfResult> bookshelfList = const [],
      @JsonKey(name: 'vocabularies')
      final List<MyVocabularyResult> vocabularyList = const [],
      @JsonKey(name: 'company_information') this.companyInformation,
      @JsonKey(name: 'in_app_campaign') this.inAppCampaign,
      this.homework = "",
      this.news = "",
      @JsonKey(name: 'files') this.filesInformation})
      : _mainSongInformation = mainSongInformation,
        _bookshelfList = bookshelfList,
        _vocabularyList = vocabularyList;

  factory _$MainInformationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainInformationResultImplFromJson(json);

  @override
  @JsonKey(name: 'story')
  final MainStoryInformationResult? mainStoryInformation;
  final List<SeriesInformationResult> _mainSongInformation;
  @override
  @JsonKey(name: 'song')
  List<SeriesInformationResult> get mainSongInformation {
    if (_mainSongInformation is EqualUnmodifiableListView)
      return _mainSongInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mainSongInformation);
  }

  final List<MyBookshelfResult> _bookshelfList;
  @override
  @JsonKey(name: 'bookshelves')
  List<MyBookshelfResult> get bookshelfList {
    if (_bookshelfList is EqualUnmodifiableListView) return _bookshelfList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookshelfList);
  }

  final List<MyVocabularyResult> _vocabularyList;
  @override
  @JsonKey(name: 'vocabularies')
  List<MyVocabularyResult> get vocabularyList {
    if (_vocabularyList is EqualUnmodifiableListView) return _vocabularyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vocabularyList);
  }

  @override
  @JsonKey(name: 'company_information')
  final CompanyInformation? companyInformation;
  @override
  @JsonKey(name: 'in_app_campaign')
  final InAppCampaignResult? inAppCampaign;
  @override
  @JsonKey()
  final String homework;
  @override
  @JsonKey()
  final String news;
  @override
  @JsonKey(name: 'files')
  final FileInformationResult? filesInformation;

  @override
  String toString() {
    return 'MainInformationResult(mainStoryInformation: $mainStoryInformation, mainSongInformation: $mainSongInformation, bookshelfList: $bookshelfList, vocabularyList: $vocabularyList, companyInformation: $companyInformation, inAppCampaign: $inAppCampaign, homework: $homework, news: $news, filesInformation: $filesInformation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainInformationResultImpl &&
            (identical(other.mainStoryInformation, mainStoryInformation) ||
                other.mainStoryInformation == mainStoryInformation) &&
            const DeepCollectionEquality()
                .equals(other._mainSongInformation, _mainSongInformation) &&
            const DeepCollectionEquality()
                .equals(other._bookshelfList, _bookshelfList) &&
            const DeepCollectionEquality()
                .equals(other._vocabularyList, _vocabularyList) &&
            (identical(other.companyInformation, companyInformation) ||
                other.companyInformation == companyInformation) &&
            (identical(other.inAppCampaign, inAppCampaign) ||
                other.inAppCampaign == inAppCampaign) &&
            (identical(other.homework, homework) ||
                other.homework == homework) &&
            (identical(other.news, news) || other.news == news) &&
            (identical(other.filesInformation, filesInformation) ||
                other.filesInformation == filesInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mainStoryInformation,
      const DeepCollectionEquality().hash(_mainSongInformation),
      const DeepCollectionEquality().hash(_bookshelfList),
      const DeepCollectionEquality().hash(_vocabularyList),
      companyInformation,
      inAppCampaign,
      homework,
      news,
      filesInformation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainInformationResultImplCopyWith<_$MainInformationResultImpl>
      get copyWith => __$$MainInformationResultImplCopyWithImpl<
          _$MainInformationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainInformationResultImplToJson(
      this,
    );
  }
}

abstract class _MainInformationResult implements MainInformationResult {
  factory _MainInformationResult(
      {@JsonKey(name: 'story')
      final MainStoryInformationResult? mainStoryInformation,
      @JsonKey(name: 'song')
      final List<SeriesInformationResult> mainSongInformation,
      @JsonKey(name: 'bookshelves') final List<MyBookshelfResult> bookshelfList,
      @JsonKey(name: 'vocabularies')
      final List<MyVocabularyResult> vocabularyList,
      @JsonKey(name: 'company_information')
      final CompanyInformation? companyInformation,
      @JsonKey(name: 'in_app_campaign')
      final InAppCampaignResult? inAppCampaign,
      final String homework,
      final String news,
      @JsonKey(name: 'files')
      final FileInformationResult?
          filesInformation}) = _$MainInformationResultImpl;

  factory _MainInformationResult.fromJson(Map<String, dynamic> json) =
      _$MainInformationResultImpl.fromJson;

  @override
  @JsonKey(name: 'story')
  MainStoryInformationResult? get mainStoryInformation;
  @override
  @JsonKey(name: 'song')
  List<SeriesInformationResult> get mainSongInformation;
  @override
  @JsonKey(name: 'bookshelves')
  List<MyBookshelfResult> get bookshelfList;
  @override
  @JsonKey(name: 'vocabularies')
  List<MyVocabularyResult> get vocabularyList;
  @override
  @JsonKey(name: 'company_information')
  CompanyInformation? get companyInformation;
  @override
  @JsonKey(name: 'in_app_campaign')
  InAppCampaignResult? get inAppCampaign;
  @override
  String get homework;
  @override
  String get news;
  @override
  @JsonKey(name: 'files')
  FileInformationResult? get filesInformation;
  @override
  @JsonKey(ignore: true)
  _$$MainInformationResultImplCopyWith<_$MainInformationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
