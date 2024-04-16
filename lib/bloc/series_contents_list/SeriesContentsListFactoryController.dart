

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/series_contents_list/api/SeriesContentsListBloc.dart';
import 'package:foxschool/bloc/series_contents_list/api/event/GetSeriesContentsDataEvent.dart';
import 'package:foxschool/bloc/series_contents_list/api/state/SeriesContentsDataLoadedState.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/EnableBottomSelectViewCubit.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/SelectItemCountCubit.dart';
import 'package:foxschool/data/contents/DetailItemInformationResult.dart';
import 'package:foxschool/view/screen/MoviePlayerScreen.dart';

import '../../common/Common.dart';
import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../data/main/series/base/SeriesBaseResult.dart';
import 'factory/cubit/SeriesItemListCubit.dart';
import 'package:foxschool/common/PageNavigator.dart' as Page;

class SeriesContentsListFactoryController extends BlocController {
  late StreamSubscription _subscription;
  late DetailItemInformationResult _seriesContentsData;
  List<ContentsBaseResult> _currentContentsItemList = [];
  bool isStillOnSeries = false;
  final BuildContext context;
  final SeriesBaseResult currentSeriesBaseResult;

  SeriesContentsListFactoryController({
    required this.context,
    required this.currentSeriesBaseResult
  });

  @override
  void init() {
    context.read<SeriesItemListCubit>().showLoading();

    _settingSubscriptions();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: Common.DURATION_LONG));
      BlocProvider.of<SeriesContentsBloc>(context).add(
          GetSeriesContentsDataEvent(displayID: currentSeriesBaseResult.id)
      );
    });
  }

  void _settingSubscriptions() {
    var blocState;
    _subscription = BlocProvider.of<SeriesContentsBloc>(context).stream.listen((state) async {
      switch (state.runtimeType) {
        case SeriesContentsDataLoadedState:
          blocState = state as SeriesContentsDataLoadedState;
          _seriesContentsData = blocState.data;

          if (_seriesContentsData.getSeriesID() != "") {
            if (_seriesContentsData.isSingleSeries() == false && _seriesContentsData.isStillOnSeries()) {
              isStillOnSeries = true;
            }
          }
          _initContentsItemList();
          break;
      }
    });
  }

  void _initContentsItemList() {
    _currentContentsItemList.clear();
    _currentContentsItemList.addAll(_seriesContentsData.contentsList);
    if (isStillOnSeries) {
      _currentContentsItemList = List.from(_currentContentsItemList.reversed);
    }
    context.read<SeriesItemListCubit>().showSeriesItemList(
        _getSeriesColor(),
        _seriesContentsData.isSingleSeries() ? true : false,
        _currentContentsItemList);
  }

  String _getSeriesColor() {
    String result = "";
    if (currentSeriesBaseResult.seriesType != Common.CONTENT_TYPE_SONG
        && _seriesContentsData.isSingleSeries() == false) {
      result = currentSeriesBaseResult.getStatusColor();
    }
    return result;
  }

  void _setSelectAllItem(bool isSelected)
  {
    for (int i = 0; i < _currentContentsItemList.length ; i++)
    {
      _currentContentsItemList[i] = _currentContentsItemList[i].setSelected(isSelected);
    }
    context.read<SeriesItemListCubit>().showSeriesItemList(
        _getSeriesColor(),
        _seriesContentsData.isSingleSeries() ? true : false,
        _currentContentsItemList);
  }

  int getItemSelectCount()
  {
    int count = 0;
    for(int i = 0 ; i < _currentContentsItemList.length; i++)
      {
        if(_currentContentsItemList[i].isSelected)
          {
            count++;
          }
      }
    return count;
  }


  @override
  void onPause() {}

  @override
  void onResume() {}

  @override
  void dispose() {
    _subscription.cancel();
  }

  @override
  void onBackPressed() {
    Navigator.of(context).pop();
  }

  void enableBottomSelectViewMode()
  {
    context.read<EnableBottomSelectViewCubit>().enableBottomSelectView(true);
  }

  void disableBottomSelectViewMode()
  {
    context.read<EnableBottomSelectViewCubit>().enableBottomSelectView(false);
    _setSelectAllItem(false);
    context.read<SelectItemCountCubit>().setSelectItemCount(0);
  }

  void onSelectedItem(int index)
  {
    int itemCount = 0;
    if (_currentContentsItemList[index].isSelected)
    {
      _currentContentsItemList[index] = _currentContentsItemList[index].setSelected(false);
    }
    else
    {
      _currentContentsItemList[index] = _currentContentsItemList[index].setSelected(true);
    }
    context.read<SeriesItemListCubit>().showSeriesItemList(
        _getSeriesColor(),
        _seriesContentsData.isSingleSeries() ? true : false,
        _currentContentsItemList);

    itemCount = getItemSelectCount();

    if (itemCount == 0)
    {
      disableBottomSelectViewMode();
    }
    else
    {
      if (itemCount == 1)
      {
        enableBottomSelectViewMode();
      }
    }
    context.read<SelectItemCountCubit>().setSelectItemCount(itemCount);
  }

  void onSelectAll()
  {
    _setSelectAllItem(true);
  }

  void onClickThumbnailItem(int index)
  {
    Logger.d("index : ${index}");
    List<ContentsBaseResult> itemList = [];
    itemList.add(_currentContentsItemList[index]);

    Navigator.push(
        context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playList: itemList)
        )
    );
  }

  void onClickSelectedListPlay()
  {

    List<ContentsBaseResult> list = [];
    for(int i = 0 ; i < _currentContentsItemList.length; i++)
    {
      if(_currentContentsItemList[i].isSelected)
      {
        list.add(_currentContentsItemList[i].setSelected(false));
      }
    }

    disableBottomSelectViewMode();
    Navigator.push(
        context,
        Page.getDefaultTransition(context,
            MoviePlayerScreen(playList: list)
        )
    );
  }
}