
import 'package:foxschool/data/model/quiz/save_data/QuizStudyRecordData.dart';
import 'package:foxschool/data/model/version_data_result/VersionDataResult.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/vocabulary/VocabularyDataResult.dart';

abstract class FoxSchoolRepository{
  Future<BaseResponse> getSchoolList();
  Future<BaseResponse> login(String userID, String password, String schoolCode);
  Future<BaseResponse> getVersion(String deviceID, String pushAddress, String pushOn);
  Future<BaseResponse> authMe();
  Future<BaseResponse> mainInformation();
  Future<BaseResponse> seriesStoryData(String displayID);
  Future<BaseResponse> getSearchList(String type, String keyword, String currentPage);
  Future<BaseResponse> authContentsPlayAsync(String data);
  Future<BaseResponse> saveMovieStudyAsync(String contentID, String playType, String playTime, int? homeworkNumber);
  Future<BaseResponse> quizInformationAsync(String contentID);
  Future<BaseResponse> saveQuizRecord(QuizStudyRecordData data, {int homeworkNumber = 0});
  Future<BaseResponse> vocabularyContentsListAsync(String contentID);
  Future<BaseResponse> vocabularyShelfListAsync(String vocabularyID);
  Future<BaseResponse> addMyVocabularyContentsAsync(String contentID, String vocabularyID, List<VocabularyDataResult> data);
  Future<BaseResponse> deleteMyVocabularyContentsAsync(String vocabularyID, List<VocabularyDataResult> data);
  Future<BaseResponse> createBookshelfAsync(String name, String color);
  Future<BaseResponse> updateBookshelfAsync(String bookshelfID, String name, String color);
  Future<BaseResponse> deleteBookshelfAsync(String bookshelfID);
  Future<BaseResponse> createVocabularyAsync(String name, String color);
  Future<BaseResponse> updateVocabularyAsync(String vocabularyID, String name, String color);
  Future<BaseResponse> deleteVocabularyAsync(String vocabularyID);
  Future<BaseResponse> bookshelfContentListAsync(String bookshelfID);
  Future<BaseResponse> addMyBookshelfContentsAsync(String bookshelfID, List<ContentsBaseResult> data);  Future<BaseResponse> deleteMyBookshelfContentsAsync(String bookshelfID, List<ContentsBaseResult> data);

}