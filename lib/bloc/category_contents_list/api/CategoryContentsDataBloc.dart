
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/category_contents_list/api/event/CategoryContentsDataEvent.dart';
import 'package:foxschool/bloc/category_contents_list/api/state/CategoryContentsDataState.dart';
import 'package:foxschool/data/base/BaseResponse.dart';
import 'package:foxschool/data/story_category_contents/StoryCategoryContentsResult.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../../api/remote_intro/FoxSchoolRepository.dart';
import '../../../common/Common.dart';

class CategoryContentsDataBloc extends Bloc<BlocEvent, BlocState>
{
  final FoxSchoolRepository repository;
  CategoryContentsDataBloc({
    required this.repository 
  }) : super(InitState())
  {
    on<CategoryContentsDataEvent>(_onCategoryContentsData);
  }
  
  void _onCategoryContentsData(CategoryContentsDataEvent event, Emitter<BlocState> state) async
  {
    try
    {
      emit(LoadingState());
      BaseResponse response = await repository.seriesStoryData(event.displayID);
      Logger.d("response : ${response.toString()}");
      if(response.status == Common.SUCCESS_CODE_OK)
        {

          if(response.access_token != "")
            {
              await Preference.setString(Common.PARAMS_ACCESS_TOKEN, response.access_token);
            }
          StoryCategoryContentsResult result = StoryCategoryContentsResult.fromJson(response.data);
          emit(CategoryContentsDataState(data: result));
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