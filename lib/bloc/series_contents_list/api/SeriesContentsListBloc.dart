import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/series_contents_list/api/event/SeriesContentsDataEvent.dart';
import 'package:foxschool/bloc/series_contents_list/api/state/SeriesContentsDataLoadedState.dart';
import 'package:foxschool/data/contents/DetailItemInformationResult.dart';
import '../../../common/Common.dart';
import '../../../data/main/my_book/MyBookshelfResult.dart';
import '../../base/BlocState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

import '../../bookshelf/api/event/BookshelfContentsAddEvent.dart';
import '../../bookshelf/api/state/BookshelfContentsAddState.dart';

class SeriesContentsBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  SeriesContentsBloc({
   required this.repository
  }) : super(InitState())
  {
    on<SeriesContentsDataEvent>(_onGetSeriesContentsData);
    on<BookshelfContentsAddEvent>(_onAddBookshelfContents);
  }

  void _onGetSeriesContentsData(SeriesContentsDataEvent event, Emitter<BlocState> emit) async
  {
    try
    {
      BaseResponse response = await repository.seriesStoryData(event.displayID);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "") {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        DetailItemInformationResult result = DetailItemInformationResult.fromJson(response.data);
        emit(SeriesContentsDataLoadedState(data: result));
      }
      else
      {
        emit(ErrorState(message: response.message));
      }
    }
    catch(e)
    {
      emit(ErrorState(message: e.toString()));
    }
  }

  void _onAddBookshelfContents(BookshelfContentsAddEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.addMyBookshelfContentsAsync(event.bookshelfID, event.data);
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
        {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
        emit(BookshelfContentsAddState(data: result));
      }
      else
      {
        emit(ErrorState(message: response.message));
      }
    }catch(e)
    {
      emit(ErrorState(message: e.toString()));
    }
  }

}