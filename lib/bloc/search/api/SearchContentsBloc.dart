

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/category_contents_list/api/event/CategoryContentsEvent.dart';
import 'package:foxschool/bloc/search/api/event/SearchContentsListEvent.dart';
import 'package:foxschool/bloc/search/api/state/SearchContentsListLoadedState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/search/SearchListPagingResult.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../../api/remote_intro/FoxSchoolRepository.dart';
import '../../../common/Common.dart';

class SearchContentsBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  SearchContentsBloc({
    required this.repository
  }): super(InitState())
  {
    on<SearchContentsListEvent>(_onSearchContentsData);
  }


  void _onSearchContentsData(SearchContentsListEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.getSearchList(event.type, event.keyword, event.currentPage);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "")
          {
            await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
          }
        SearchListPagingResult result = SearchListPagingResult.fromJson(response.data);
        emit(SearchContentsListLoadedState(data: result));
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

}