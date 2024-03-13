
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';

import '../../data/base/BaseResponse.dart';

abstract class IntroDataSource{
  Future<BaseResponse> getSchoolList();
  Future<BaseResponse> login(String userID, String password, String schoolCode);
  Future<BaseResponse> getVersion(String deviceID, String pushAddress, String pushOn);
  Future<BaseResponse> authMe();
  Future<BaseResponse> mainInformation();

}