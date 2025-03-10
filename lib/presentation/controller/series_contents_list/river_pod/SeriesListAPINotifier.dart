
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/base/BaseResponse.dart';
import 'package:foxschool/data/model/contents/DetailItemInformationResult.dart';
import 'package:foxschool/data/model/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/controller/common/CommonAPIState.dart';
import 'package:foxschool/presentation/controller/series_contents_list/river_pod/data/SeriesListAPIState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

part 'SeriesListAPINotifier.g.dart';

@riverpod
class SeriesListAPINotifier extends _$SeriesListAPINotifier
{
  late FoxSchoolRepository repository;
  @override
  SeriesListAPIState build(FoxSchoolRepository repo) {
    repository = repo;
    return const SeriesListAPIState.common(
      CommonAPIState.initState()
    );
  }

  void requestSeriesContentsData(String displayID) async
  {
    try
    {
      BaseResponse response = await repository.seriesStoryData(displayID);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "") {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        DetailItemInformationResult result = DetailItemInformationResult.fromJson(response.data);
        state = SeriesListAPIState.seriesContentsDataLoadedState(result);
      }
      else
      {
        state = SeriesListAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }
    catch(e)
    {
      state = SeriesListAPIState.common(
          CommonAPIState.errorState(e.toString())
      );
    }
  }

  void requestAddBookshelfContents(String bookshelfID, List<ContentsBaseResult> data) async
  {
    try
    {
      state = const SeriesListAPIState.common(
          CommonAPIState.loadingState()
      );
      BaseResponse response = await repository.addMyBookshelfContentsAsync(bookshelfID, data);
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
        state = SeriesListAPIState.bookshelfContentsAddState(result);
      }
      else
      {
        state = SeriesListAPIState.common(
            CommonAPIState.errorState(response.message)
        );
      }
    }catch(e)
    {
      state = SeriesListAPIState.common(
          CommonAPIState.errorState(e.toString())
      );
    }
  }
}