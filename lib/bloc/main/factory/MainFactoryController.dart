

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainMyBooksTypeCubit.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainSongCategoryListCubit.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainStorySelectTypeListCubit.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/route/RouteHelper.dart';

import '../../../common/Common.dart';
import '../../../data/main/MainInformationResult.dart';
import '../../../data/main/my_book/MyBookshelfResult.dart';
import '../../../data/main/my_vocabulary/MyVocabularyResult.dart';
import '../../../data/main/series/SeriesInformationResult.dart';
import '../../../enum/SeriesType.dart';

class MainFactoryController extends BlocController
{
  final int TYPE_LEVELS = 0;
  final int TYPE_CATEGORIES = 1;

  late List<SeriesInformationResult> _storyLevelItemList;
  late List<SeriesInformationResult> _storyCategoriesList;
  late List<SeriesInformationResult> _songCategoriesList;
  late List<MyBookshelfResult> _bookshelfList;
  late List<MyVocabularyResult> _vocabularyList;
  SeriesType _currentStorySeriesType = SeriesType.LEVEL;

  final BuildContext context;
  MainFactoryController({
    required this.context
  });

  @override
  void init() {
    _initData();
  }

  void _initData() async
  {
    Map<String, dynamic>? jsonMap = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    if(jsonMap != null)
    {
      MainInformationResult baseData = MainInformationResult.fromJson(jsonMap);
      _storyLevelItemList = baseData.mainStoryInformation!.levelsList;
      _storyCategoriesList = baseData.mainStoryInformation!.categoriesList;
      _songCategoriesList = baseData.mainSongInformation;
      _bookshelfList = baseData.bookshelfList;
      _vocabularyList =baseData.vocabularyList;
    }

    Logger.d("_vocabularyList data : ${_vocabularyList.toString()}");
    _settingStoryPageData(SeriesType.LEVEL);
    _settingSongPageData();
    _settingMyBooksData(MyBooksType.BOOKSHELF);
  }

  void _settingStoryPageData(SeriesType type)
  {
    _currentStorySeriesType = type;
    if(type == SeriesType.LEVEL)
    {
      context.read<MainStorySelectTypeListCubit>().setSelectTypeList(_storyLevelItemList);
    }
    else
    {
      context.read<MainStorySelectTypeListCubit>().setSelectTypeList(_storyCategoriesList);
    }
  }

  void _settingSongPageData()
  {
    context.read<MainSongCategoryListCubit>().setSongCategoryList(_songCategoriesList);
  }

  void _settingMyBooksData(MyBooksType type)
  {
    context.read<MainMyBooksTypeCubit>()
        .setMyBooksTypeData(
        type,
        _bookshelfList,
        _vocabularyList
    );
  }

  void onClickStorySelectType(SeriesType type)
  {
    Logger.d("type : ${type}");
    _settingStoryPageData(type);
  }

  void onClickMyBooksType(MyBooksType type)
  {
    _settingMyBooksData(type);
  }

  void onClickSeriesItem(SeriesInformationResult data)
  {
    if(_currentStorySeriesType == SeriesType.LEVEL)
      {
        Navigator.of(context).pushNamed(RouteHelper.getSeriesContentsList(), arguments: data);
      }
  }

  @override
  void dispose() {

  }

  @override
  void onBackPressed() {}

}