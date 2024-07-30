import 'package:dio/dio.dart';
import 'package:foxschool/data/model/version_data_result/VersionDataResult.dart';
import 'package:retrofit/retrofit.dart';

import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';

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

  @GET('contents/vocabularies/{vocabularyID}')
  Future<BaseResponse> vocabularyShelfListAsync(
      @Path('vocabularyID') String requestID
      );

  @PUT('contents/vocabularies/{vocabulary_id}/words')
  Future<BaseResponse> addMyVocabularyContentsAsync(
      @Path('vocabulary_id') String vocabularyID,
      @Queries(encoded: true) Map<String, String> queryMap
      );

  @DELETE('contents/vocabularies/{vocabulary_id}/words')
  Future<BaseResponse> deleteMyVocabularyContentsAsync(
      @Path('vocabulary_id') String vocabularyID,
      @Queries(encoded: true) Map<String, String> queryMap
      );

  @PUT('contents/bookshelves')
  Future<BaseResponse> createBookshelfAsync(
      @Field('name') String name,
      @Field('color') String color
      );

  @POST('contents/bookshelves/{bookshelf_id}')
  Future<BaseResponse> updateBookshelfAsync(
      @Path('bookshelf_id') String bookshelfID,
      @Field('name') String name,
      @Field('color') String color,
      );

  @DELETE('contents/bookshelves/{bookshelf_id}')
  Future<BaseResponse> deleteBookshelfAsync(
      @Path('bookshelf_id') String bookshelfID
      );

  @PUT('contents/vocabularies')
  Future<BaseResponse> createVocabularyAsync(
      @Field('name') String name,
      @Field('color') String color
      );

  @POST('contents/vocabularies/{vocabulary_id}')
  Future<BaseResponse> updateVocabularyAsync(
      @Path('vocabulary_id') String vocabularyID,
      @Field('name') String name,
      @Field('color') String color
      );

  @DELETE('contents/vocabularies/{vocabulary_id}')
  Future<BaseResponse> deleteVocabularyAsync(
      @Path('vocabulary_id') String vocabularyID
      );

  @GET('contents/bookshelves/{bookshelf_id}')
  Future<BaseResponse> bookshelfContentsListAsync(
      @Path('bookshelf_id') String bookshelfID
      );
  
  @PUT('contents/bookshelves/{bookshelf_id}/contents')
  Future<BaseResponse> addMyBookshelfContentsAsync(
      @Path('bookshelf_id') String bookshelfID,
      @Queries(encoded: true) Map<String, String> queryMap
      );

  @DELETE('contents/bookshelves/{bookshelf_id}/contents')
  Future<BaseResponse> deleteMyBookshelfContentsAsync(
      @Path('bookshelf_id') String bookshelfID,
      @Queries(encoded: true) Map<String, String> queryMap
      );


}

