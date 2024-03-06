import 'package:dio/dio.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';
import 'package:retrofit/retrofit.dart';

import '../common/Common.dart';
import '../data/base/BaseResponse.dart';

part 'ApiClient.g.dart';

@RestApi(baseUrl: Common.BASE_API)
abstract class ApiClient
{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @FormUrlEncoded()
  @POST("app/version")
  Future<BaseResponse> initAsync(
      @Field("device_id") String device_id,
      @Field("push_address") String push_address,
      @Field("push_on") String push_on
      );

  @GET("users/school")
  Future<BaseResponse> schoolListAsync();
}