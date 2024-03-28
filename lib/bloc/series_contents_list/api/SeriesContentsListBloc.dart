import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/api/remote_intro/FoxSchoolRepository.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/series_contents_list/api/event/SeriesStoryDataEvent.dart';
import 'package:foxschool/bloc/series_contents_list/api/state/SeriesStoryDataState.dart';
import 'package:foxschool/data/contents/DetailItemInformationResult.dart';
import '../../../common/Common.dart';
import '../../base/BlocState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/common/Preference.dart' as Preference;

class SeriesContentsBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  SeriesContentsBloc({
   required this.repository
  }) : super(InitState())
  {
    on<SeriesStoryDataEvent>(_onSeriesStoryData);
  }

  void _onSeriesStoryData(SeriesStoryDataEvent event, Emitter<BlocState> emit) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.seriesStoryData(event.displayID);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
      {
        if(response.access_token != "") {
          await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
        }
        DetailItemInformationResult result = DetailItemInformationResult.fromJson(response.data);
        emit(SeriesStoryDataState(data: result));
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