

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainMyBooksTypeCubit.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainSongCategoryListCubit.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainStorySelectTypeListCubit.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainUserInformationCubit.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/view/screen/IntroScreen.dart';
import 'package:foxschool/view/screen/SearchScreen.dart';
import 'package:foxschool/view/screen/SeriesContentListScreen.dart';
import 'package:foxschool/view/screen/StoryCategoryListScreen.dart';

import '../../common/Common.dart';
import '../../data/login/LoginInformationResult.dart';
import '../../data/main/MainInformationResult.dart';
import '../../data/main/my_book/MyBookshelfResult.dart';
import '../../data/main/my_vocabulary/MyVocabularyResult.dart';
import '../../data/main/series/SeriesInformationResult.dart';
import '../../enum/StorySeriesType.dart';
import 'package:page_transition/page_transition.dart';

class MainFactoryController extends BlocController
{
  final int TYPE_LEVELS = 0;
  final int TYPE_CATEGORIES = 1;

  late List<SeriesInformationResult> _storyLevelItemList;
  late List<SeriesInformationResult> _storyCategoriesList;
  late List<SeriesInformationResult> _songCategoriesList;
  late List<MyBookshelfResult> _bookshelfList;
  late List<MyVocabularyResult> _vocabularyList;
  StorySeriesType _currentStorySeriesType = StorySeriesType.LEVEL;
  late MainInformationResult _mainData;
  late LoginInformationResult _userData;
  String _schoolName = "";
  String _userName = "";
  String _userClass = "";

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
    await _loadMainData();
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
    _settingStoryPageData(StorySeriesType.LEVEL);
    _settingSongPageData();
    _settingMyBooksData(MyBooksType.BOOKSHELF);
  }

  Future<void> _loadMainData() async
  {
    Object? userObject = await Preference.getObject(Common.PARAMS_USER_API_INFORMATION);
    if (userObject != null) {
      _userData = LoginInformationResult.fromJson(userObject as Map<String, dynamic>);
      context.read<MainUserInformationCubit>().setUserInformation(
          _userData.userData!.name,
          _userData.schoolData!.className,
          _userData.schoolData!.name
      );
    }

    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    if (mainObject != null) {
      _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
    }
  }

  void _settingStoryPageData(StorySeriesType type)
  {
    _currentStorySeriesType = type;
    if(type == StorySeriesType.LEVEL)
    {
      context.read<MainStorySelectTypeListCubit>().setSelectTypeList(StorySeriesType.LEVEL, _storyLevelItemList);
    }
    else
    {
      context.read<MainStorySelectTypeListCubit>().setSelectTypeList(StorySeriesType.CATEGORY, _storyCategoriesList);
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

  @override
  void onPause() {}

  @override
  void onResume() {}

  @override
  void dispose() {

  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  void onClickStorySelectType(StorySeriesType type)
  {
    Logger.d("type : ${type}");
    _settingStoryPageData(type);
  }

  void onClickMyBooksType(MyBooksType type)
  {
    _settingMyBooksData(type);
  }

  void onClickStorySeriesItem(SeriesInformationResult data, Widget widget)
  {
    if(_currentStorySeriesType == StorySeriesType.LEVEL) {
      Navigator.push(
        context,
          Page.getSeriesDetailListTransition(context, SeriesContentListScreen(seriesBaseResult: data))
      );
    }
    else
    {
      Navigator.push(
          context,
          Page.getSeriesDetailListTransition(context, StoryCategoryListScreen(seriesBaseResult: data))
      );
    }
  }

  void onClickSongSeriesItem(SeriesInformationResult data, Widget widget)
  {
    Navigator.push(
        context,
        Page.getSeriesDetailListTransition(context, SeriesContentListScreen(seriesBaseResult: data))
    );
  }

  void onClickSearch()
  {
    Navigator.push(
        context,
        Page.getDefaultTransition(context,  const SearchScreen())
    );
  }

  void onClickLogout() async
  {
    await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
    await Preference.setObject(Common.PARAMS_USER_API_INFORMATION, null);
    Navigator.pushAndRemoveUntil(
        context,
        Page.getLogoutTransition(context),
       (route) => false,
    );
  }
}