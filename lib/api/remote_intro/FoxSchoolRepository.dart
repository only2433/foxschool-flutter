
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/ApiClient.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolDataSource.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';
import 'package:foxschool/data/vocabulary/VocabularyDataResult.dart';

import '../../common/Common.dart';

class FoxSchoolRepository extends FoxSchoolDataSource
{
  final Dio dio;
  final ApiClient apiClient;

  FoxSchoolRepository({
    required this.dio,
    required this.apiClient
  });

  @override
  Future<BaseResponse> getVersion(String deviceID, String pushAddress, String pushOn) async
  {
    return apiClient.initAsync(deviceID, pushAddress, pushOn);
  }

  @override
  Future<BaseResponse> getSchoolList() async
  {
    return apiClient.schoolListAsync();
  }

  @override
  Future<BaseResponse> login(String userID, String password, String schoolCode) async{
    return apiClient.loginAsync(userID, password, schoolCode);
  }

  @override
  Future<BaseResponse> authMe() async{
    return apiClient.authMeAsync();

  }

  @override
  Future<BaseResponse> mainInformation() async{
    return apiClient.mainAsync();
  }

  @override
  Future<BaseResponse> seriesStoryData(String displayID) {
    return apiClient.seriesStoryContentsDataAsync(displayID);
  }

  @override
  Future<BaseResponse> getSearchList(String type, String keyword, String currentPage) {
    return apiClient.getSearchListAsync(type, keyword, Common.PAGE_LOAD_COUNT.toString(), currentPage);
  }

  @override
  Future<BaseResponse> authContentsPlayAsync(String data) {
    return apiClient.authContentsPlayAsync(data);
  }

  @override
  Future<BaseResponse> saveMovieStudyAsync(String contentID, String playType, String playTime, int? homeworkNumber) {
    return apiClient.saveMovieStudyAsync(contentID, playType, playTime, homeworkNumber);
  }

  @override
  Future<BaseResponse> quizInformationAsync(String contentID) {
    return apiClient.quizInformationAsync(contentID);
  }

  @override
  Future<BaseResponse> vocabularyContentsListAsync(String contentID){
    return apiClient.vocabularyContentsListAsync(contentID);
  }

  @override
  Future<BaseResponse> vocabularyShelfListAsync(String vocabularyID) {
    return apiClient.vocabularyShelfListAsync(vocabularyID);
  }


  @override
  Future<BaseResponse> addVocabularyContentsAsync(String contentID, String vocabularyID, List<VocabularyDataResult> data) {

    Logger.d("contentID : $contentID, vocabularyID : $vocabularyID");
    Map<String, String> queriesMap = {};
    queriesMap['content_id'] = contentID;

    for(int i = 0; i < data.length; i++)
      {
        Logger.d("word_ids[$i] : ${data[i].vocabularyID}");
        queriesMap['word_ids[$i]'] = data[i].vocabularyID;
      }


    return apiClient.addVocabularyContents(vocabularyID, queriesMap);
  }

  @override
  Future<BaseResponse> deleteVocabularyContentsAsync(String vocabularyID, List<VocabularyDataResult> data)
  {
    Map<String, String> queriesMap = {};

    for(int i = 0; i < data.length; i++)
      {
        queriesMap['words[$i][content_id]'] = data[i].contentID;
        queriesMap['words[$i][word_id]'] = data[i].vocabularyID;
      }

    return apiClient.deleteVocabularyContents(vocabularyID, queriesMap);
  }

  @override
  Future<BaseResponse> createBookshelfAsync(String name, String color) {
    return apiClient.createBookshelfAsync(name, color);
  }

  @override
  Future<BaseResponse> createVocabularyAsync(String name, String color) {
    return apiClient.createVocabularyAsync(name, color);
  }

  @override
  Future<BaseResponse> deleteBookshelfAsync(String bookshelfID) {
    return apiClient.deleteBookshelfAsync(bookshelfID);
  }

  @override
  Future<BaseResponse> deleteVocabularyAsync(String vocabularyID) {
    return apiClient.deleteVocabularyAsync(vocabularyID);
  }

  @override
  Future<BaseResponse> updateBookshelfAsync(String bookshelfID, String name, String color) {
    return apiClient.updateBookshelfAsync(bookshelfID, name, color);
  }

  @override
  Future<BaseResponse> updateVocabularyAsync(String vocabularyID, String name, String color) {
    return apiClient.updateVocabularyAsync(vocabularyID, name, color);
  }
}