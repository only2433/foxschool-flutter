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

  @GET('auth/me')
  Future<BaseResponse> authMeAsync();

  @GET('app/main')
  Future<BaseResponse> mainAsync();

  @FormUrlEncoded()
  @POST('auth/login')
  Future<BaseResponse> loginAsync(
      @Field('login_id') String id,
      @Field('password') String password,
      @Field('school_id') String schoolCode
      );

  @GET('contents/story/series/{display_id}')
  Future<BaseResponse> seriesStoryContentsDataAsync(
      @Path('display_id') String displayID
      );

  @GET('contents/song/series/{display_id}')
  Future<BaseResponse> seriesSongContentsDataAsync(
      @Path('display_id') String displayID
      );

  @GET('contents/search')
  Future<BaseResponse> getSearchListAsync(
      @Query('type') String? searchType,
      @Query('keyword') String keyword,
      @Query('per_page') String pageCount,
      @Query('page') String currentPage
      );

  @GET('contents/player/{data}')
  Future<BaseResponse> authContentsPlayAsync(
      @Path('data') String requestData
      );

  @FormUrlEncoded()
  @POST('contents/player/save')
  Future<BaseResponse> saveMovieStudyAsync(
      @Field('content_id') String contentID,
      @Field('play_type') String playType,
      @Field('play_time') String playTime,
      @Field('hw_no') int? homeworkNumber
      );

  @GET('contents/quiz/{contentID}')
  Future<BaseResponse> quizInformationAsync(
      @Path('contentID') String requestID
      );

  @GET('contents/vocabularies/{contentID}')
  Future<BaseResponse> vocabularyContentsListAsync(
      @Path('contentID') String requestID
      );



}