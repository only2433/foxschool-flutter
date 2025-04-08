
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/story_category_contents/StoryCategoryContentsResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/controller/category_list/river_pod/data/CategoryListAPIState.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'CategoryListAPINotifier.g.dart';

@riverpod
class CategoryListAPINotifier extends _$CategoryListAPINotifier
{
  late FoxSchoolRepository repository;
  @override
  CategoryListAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return CategoryListAPIState.common(
        CommonAPIState.initState()
    );
  }

  void requestCategoryListData(String displayID) async
  {
    try
    {
      state = CategoryListAPIState.common(CommonAPIState.loadingState());
      BaseResponse response = await repository.seriesStoryData(displayID);
      Logcats.message("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        StoryCategoryContentsResult result = StoryCategoryContentsResult.fromJson(response.data);
        state = CategoryListAPIState.contentsLoadedState(result);
      }
      else
      {
        state = CategoryListAPIState.common(
          CommonAPIState.errorState(response.message)
        );
      }
    }catch(e)
    {
      state = CategoryListAPIState.common(
        CommonAPIState.errorState(e.toString())
      );
    }
  }
}