
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';

import '../../data/base/BaseResponse.dart';
import '../../data/vocabulary/VocabularyDataResult.dart';

abstract class FoxSchoolDataSource{
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
  Future<BaseResponse> vocabularyContentsListAsync(String contentID);
  Future<BaseResponse> vocabularyShelfListAsync(String vocabularyID);
  Future<BaseResponse> addVocabularyContents(String contentID, String vocabularyID, List<VocabularyDataResult> data);
  Future<BaseResponse> deleteVocabularyContents(String vocabularyID, List<VocabularyDataResult> data);

}