
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foxschool/api/ApiClient.dart';
import 'package:foxschool/api/remote_intro/IntroDataSource.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';

class IntroRepository extends IntroDataSource
{
  final Dio dio;
  final ApiClient apiClient;

  IntroRepository({
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

}