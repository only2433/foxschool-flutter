

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocException.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/bookshelf/api/event/BookshelfContentListEvent.dart';
import 'package:foxschool/bloc/bookshelf/api/event/BookshelfContentsAddEvent.dart';
import 'package:foxschool/bloc/bookshelf/api/event/BookshelfContentsDeleteEvent.dart';
import 'package:foxschool/bloc/bookshelf/api/state/BookshelfContentListLoadedState.dart';
import 'package:foxschool/bloc/bookshelf/api/state/BookshelfContentsAddState.dart';
import 'package:foxschool/bloc/bookshelf/api/state/BookshelfContentsDeleteState.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/data/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';
import '../../../api/remote_intro/FoxSchoolRepository.dart';
import '../../../common/Common.dart';
import '../../../data/base/BaseResponse.dart';

class MyBookshelfBloc extends Bloc<BlocEvent, BlocState> with BlocException
{
  final FoxSchoolRepository repository;
  MyBookshelfBloc({
    required this.repository
  }) : super(InitState())
  {
    on<BookshelfContentListEvent>(_onGetBookshelfContentsList);
    on<BookshelfContentsDeleteEvent>(_onDeleteBookshelfContents);
  }

  void _onGetBookshelfContentsList(BookshelfContentListEvent event, Emitter<BlocState> state) async
  {
    Logger.d("---------- API Request");
    try
    {
      BaseResponse response = await repository.bookshelfContentListAsync(event.id);
      Logger.d('response : ${response.toString()}');
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "")
            {
              await Preference.setObject(Common.PARAMS_ACCESS_TOKEN, response.access_token);
            }
          List<ContentsBaseResult> result = (response.data as List<dynamic>).map((item) => ContentsBaseResult.fromJson(item)).toList();
          emit(BookshelfContentListLoadedState(data: result));
        }
      else
        {
          emit(ErrorState(message: response.message));
        }
    }
    on DioException catch(e)
    {
      processException(this, e.response.toString());
    }
  }

  void _onDeleteBookshelfContents(BookshelfContentsDeleteEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.deleteMyBookshelfContentsAsync(event.bookshelfID, event.data);
      if(response.status == Common.SUCCESS_CODE_OK)
        {
          if(response.access_token != "")
            {
              Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
            }

          MyBookshelfResult result = MyBookshelfResult.fromJson(response.data);
          emit(BookshelfContentsDeleteState(data: result));
        }
      else
        {
          emit(ErrorState(message: response.message));
        }
      
    }
    on DioException catch(e)
    {
      processException(this, e.response.toString());
    }
  }
}