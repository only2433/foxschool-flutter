
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/management/api/ManagementMyBooksBloc.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyCreateEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyDeleteEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyUpdateEvent.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyCreateState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyDeleteState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyUpdateState.dart';
import 'package:foxschool/bloc/management/factory/cubit/MyBooksUpdateColorCubit.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/common/Preference.dart' as Preference;
import '../../enum/MyBooksType.dart';
import '../../view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../data/main/MainInformationResult.dart';
import '../../di/Dependencies.dart';
import '../../enum/ManagementMyBooksStatus.dart';
import '../../enum/MyBooksColorType.dart';
import '../main/factory/cubit/MainMyBooksTypeCubit.dart';

class ManagementMyBooksFactoryController extends BlocController
{
  late StreamSubscription _subscription;
  late MainInformationResult _mainData;

  final BuildContext context;
  final ManagementMyBooksStatus status;
  String myBooksID;
  String myBooksName;
  MyBooksColorType myBooksColorType;
  ManagementMyBooksFactoryController({
    required this.context,
    required this.status,
    required this.myBooksID,
    required this.myBooksName,
    required this.myBooksColorType
  });

  @override
  void init()
  {
    _settingSubscription();
    _getMainData();
    onSelectBookColor(myBooksColorType);
  }

  void _settingSubscription()
  {
    var blocState;
    _subscription = BlocProvider.of<ManagementMyBooksBloc>(context).stream.listen((state) async{
    Logger.d("state.runtimeType : ${state.runtimeType}");
      switch(state.runtimeType)
      {
        case LoadingState:
          LoadingDialog.show(context);
          break;
        case MyBooksVocabularyCreateState:
          blocState = state as MyBooksVocabularyCreateState;
          await _createMyBooksVocabulary(blocState.data);

          LoadingDialog.dismiss(context);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
            onBackPressed();
          },);
        case MyBooksVocabularyUpdateState:
          blocState = state as MyBooksVocabularyUpdateState;
          await _updateMyBooksVocabulary(blocState.data);

          LoadingDialog.dismiss(context);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
            onBackPressed();
            },);

        case MyBooksVocabularyDeleteState:
          await _deleteMyBooksVocabulary();

          LoadingDialog.dismiss(context);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
            onBackPressed();
          },);
          break;
        case ErrorState:
          blocState = state as ErrorState;
          Fluttertoast.showToast(msg: blocState.message);
          LoadingDialog.dismiss(context);
          break;
      }
    });
  }

  Future<void> _getMainData() async
  {
    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
  }

  Future<void> _updateMyBooksVocabulary(MyVocabularyResult data) async
  {
    List<MyVocabularyResult> dataList = _mainData.vocabularyList.toList();

    for(int i = 0; i < dataList.length; i++)
      {
        if(dataList[i].id == data.id)
          {
            dataList[i] = data;
            _mainData = _mainData.copyWith(vocabularyList: dataList);
            break;
          }
      }

    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    context.read<MainMyBooksTypeCubit>()
        .setMyBooksTypeData(
        MyBooksType.VOCABULARY,
        _mainData.bookshelfList,
        _mainData.vocabularyList
    );
    MainObserver().update();
  }

  Future<void> _createMyBooksVocabulary(MyVocabularyResult data) async
  {
    List<MyVocabularyResult> dataList = _mainData.vocabularyList.toList();
    dataList.add(data);
    _mainData = _mainData.copyWith(vocabularyList: dataList);
    context.read<MainMyBooksTypeCubit>()
        .setMyBooksTypeData(
        MyBooksType.VOCABULARY,
        _mainData.bookshelfList,
        dataList
    );
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    MainObserver().update();
  }

  Future<void> _deleteMyBooksVocabulary() async
  {
    List<MyVocabularyResult> dataList = _mainData.vocabularyList.toList();
    for(int i = 0; i < dataList.length; i++)
      {
        if(dataList[i].id == myBooksID)
          {
            dataList.removeAt(i);
            _mainData = _mainData.copyWith(vocabularyList: dataList);
            break;
          }
      }

    context.read<MainMyBooksTypeCubit>()
        .setMyBooksTypeData(
        MyBooksType.VOCABULARY,
        _mainData.bookshelfList,
        _mainData.vocabularyList
    );
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);

    MainObserver().update();
  }

  void _showDeleteVocabularyAction()
  {
    Logger.d("");
    FoxSchoolDialog.showSelectDialog(
      context: context,
      message: getIt<FoxschoolLocalization>().data['message_delete_vocabulary'],
      buttonText: getIt<FoxschoolLocalization>().data['text_confirm'],
      onSelected: () {
        BlocProvider.of<ManagementMyBooksBloc>(context).add(
            MyBooksVocabularyDeleteEvent(vocabularyID: myBooksID)
        );
      },);
  }


  @override
  void onBackPressed()
  {
    Navigator.of(context).pop();

  }

  @override
  void dispose()
  {
    _subscription.cancel();
  }

  void onSelectBookColor(MyBooksColorType type)
  {
    myBooksColorType = type;
    context.read<MyBooksUpdateColorCubit>().setColor(type);
  }

  void onClickSaveButton(String name)
  {
    Logger.d("");
    BlocEvent event;
    if(name != "")
      {
        if(status == ManagementMyBooksStatus.BOOKSHELF_MODIFY || status == ManagementMyBooksStatus.VOCABULARY_MODIFY)
          {
            event = MyBooksVocabularyUpdateEvent(
                vocabularyID: myBooksID,
                name: name,
                color: CommonUtils.getInstance(context).getMyBooksColorText(myBooksColorType));
          }
        else
          {
            event = MyBooksVocabularyCreateEvent(
                name: name,
                color: CommonUtils.getInstance(context).getMyBooksColorText(myBooksColorType));
          }
        BlocProvider.of<ManagementMyBooksBloc>(context).add(event);
      }
    else
      {
        Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_warning_empty_bookshelf_name']);
      }
  }

  void onClickCancelButton()
  {
    if(status == ManagementMyBooksStatus.BOOKSHELF_MODIFY || status == ManagementMyBooksStatus.VOCABULARY_MODIFY)
      {
        _showDeleteVocabularyAction();
      }
    else
      {
        onBackPressed();
      }
  }
}