
import 'package:foxschool/data/main/company_information/CompanyInformation.dart';
import 'package:foxschool/data/main/series/SeriesInformationResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'files/FileInformationResult.dart';
import 'in_app_campaign/InAppCampaignResult.dart';
import 'main_story_infomation/MainStoryInformationResult.dart';
import 'my_book/MyBookshelfResult.dart';
import 'my_vocabulary/MyVocabularyResult.dart';

part 'MainInformationResult.freezed.dart';
part 'MainInformationResult.g.dart';

@freezed
class MainInformationResult with _$MainInformationResult
{
  factory MainInformationResult({

    @JsonKey(name: 'story')
    final MainStoryInformationResult? mainStoryInformation,

    @JsonKey(name: 'song')
    @Default([])
    final List<SeriesInformationResult> mainSongInformation,

    @JsonKey(name: 'bookshelves')
    @Default([])
    final List<MyBookshelfResult> bookshelfList,

    @JsonKey(name: 'vocabularies')
    @Default([])
    final List<MyVocabularyResult> vocabularyList,

    @JsonKey(name: 'company_information')
    final CompanyInformation? companyInformation,

    @JsonKey(name: 'in_app_campaign')
    final InAppCampaignResult? inAppCampaign,

    @Default("")
    final String homework,

    @Default("")
    final String news,

    @JsonKey(name: 'files')
    final FileInformationResult? filesInformation

  }) = _MainInformationResult;

  factory MainInformationResult.fromJson(Map<String, dynamic> data) => _$MainInformationResultFromJson(data);
}