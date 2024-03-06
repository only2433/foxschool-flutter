
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';

import '../../data/base/BaseResponse.dart';

abstract class IntroDataSource{
  Future<BaseResponse> getVersion(String deviceID, String pushAddress, String pushOn);

  Future<BaseResponse> getSchoolList();
}