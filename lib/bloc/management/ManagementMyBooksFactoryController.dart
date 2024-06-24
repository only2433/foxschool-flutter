
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/bloc/base/BlocController.dart';
import 'package:foxschool/bloc/base/BlocEvent.dart';
import 'package:foxschool/bloc/base/BlocState.dart';
import 'package:foxschool/bloc/management/api/ManagementMyBooksBloc.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksBookshelfCreateEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksBookshelfDeleteEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksBookshelfUpdateEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyCreateEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyDeleteEvent.dart';
import 'package:foxschool/bloc/management/api/event/MyBooksVocabularyUpdateEvent.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksBookshelfDeleteState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyCreateState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyDeleteState.dart';
import 'package:foxschool/bloc/management/api/state/MyBooksVocabularyUpdateState.dart';
import 'package:foxschool/bloc/management/factory/cubit/MyBooksUpdateColorCubit.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:image/image.dart';
import '../../enum/MyBooksType.dart';
import '../../view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../data/main/MainInformationResult.dart';
import '../../di/Dependencies.dart';
import '../../enum/ManagementMyBooksStatus.dart';
import '../../enum/MyBooksColorType.dart';
import '../main/factory/cubit/MainMyBooksTypeCubit.dart';
import 'api/state/MyBooksBookshelfCreateState.dart';
import 'api/state/MyBooksBookshelfUpdateState.dart';

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
        case MyBooksBookshelfCreateState:
          Logger.d("");
          blocState = state as MyBooksBookshelfCreateState;
          await _createMyBooksBookshelf(blocState.data);
          LoadingDialog.dismiss(context);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
            onBackPressed();
          },);
          break;
        case MyBooksVocabularyCreateState:
          blocState = state as MyBooksVocabularyCreateState;
          await _createMyBooksVocabulary(blocState.data);
          LoadingDialog.dismiss(context);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
            onBackPressed();
          },);
          break;
        case MyBooksBookshelfUpdateState:
          blocState = state as MyBooksBookshelfUpdateState;
          await _updateMyBooksBookshelf(blocState.data);
          LoadingDialog.dismiss(context);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
            onBackPressed();
          },);
          break;
        case MyBooksVocabularyUpdateState:
          blocState = state as MyBooksVocabularyUpdateState;
          await _updateMyBooksVocabulary(blocState.data);
          LoadingDialog.dismiss(context);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
            onBackPressed();
            },);
          break;
        case MyBooksBookshelfDeleteState:
          await _deleteMyBooksBookshelf();
          LoadingDialog.dismiss(context);
          await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
            onBackPressed();
          },);
          break;
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

  void _notifyMyBooks(MyBooksType type)
  {
    context.read<MainMyBooksTypeCubit>()
        .setMyBooksTypeData(
        type,
        _mainData.bookshelfList,
        _mainData.vocabularyList
    );
    MainObserver().update();
  }

  Future<void> _createMyBooksBookshelf(MyBookshelfResult data) async
  {
    Logger.d("");
    await _getMainData();
    List<MyBookshelfResult> dataList = _mainData.bookshelfList.toList();
    dataList.add(data);
    _mainData = _mainData.copyWith(bookshelfList: dataList);
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    _notifyMyBooks(MyBooksType.BOOKSHELF);
  }
  
  Future<void> _createMyBooksVocabulary(MyVocabularyResult data) async
  {
    await _getMainData();
    List<MyVocabularyResult> dataList = _mainData.vocabularyList.toList();
    dataList.add(data);
    _mainData = _mainData.copyWith(vocabularyList: dataList);
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    _notifyMyBooks(MyBooksType.VOCABULARY);
  }
  
  Future<void> _updateMyBooksBookshelf(MyBookshelfResult data) async
  {
    await _getMainData();
    List<MyBookshelfResult> dataList = _mainData.bookshelfList.toList();
    for(int i = 0; i < dataList.length; i++)
      {
        if(dataList[i].id == data.id)
          {
            dataList[i] = data;
            _mainData = _mainData.copyWith(bookshelfList: dataList);
            break;
          }
      }
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    _notifyMyBooks(MyBooksType.BOOKSHELF);
  }

  Future<void> _updateMyBooksVocabulary(MyVocabularyResult data) async
  {
    await _getMainData();
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
    _notifyMyBooks(MyBooksType.VOCABULARY);
  }

  Future<void> _deleteMyBooksBookshelf() async
  {
    await _getMainData();
    List<MyBookshelfResult> dataList = _mainData.bookshelfList.toList();
    for(int i = 0 ; i < dataList.length ; i++)
      {
        if(dataList[i].id == myBooksID)
          {
            dataList.removeAt(i);
            _mainData = _mainData.copyWith(bookshelfList: dataList);
          }
      }
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    _notifyMyBooks(MyBooksType.BOOKSHELF);
  }

  Future<void> _deleteMyBooksVocabulary() async
  {
    await _getMainData();
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
    await Preference.setObject(Common.PARAMS_FILE_MAIN_INFO, _mainData);
    _notifyMyBooks(MyBooksType.VOCABULARY);
  }

  void _showDeleteVocabularyAction()
  {
    Logger.d("");
    FoxSchoolDialog.showSelectDialog(
      context: context,
      message: status == ManagementMyBooksStatus.BOOKSHELF_MODIFY ? getIt<FoxschoolLocalization>().data['message_delete_bookshelf'] : getIt<FoxschoolLocalization>().data['message_delete_vocabulary'],
      buttonText: getIt<FoxschoolLocalization>().data['text_confirm'],
      onSelected: () {
        if(status == ManagementMyBooksStatus.BOOKSHELF_MODIFY)
          {
            BlocProvider.of<ManagementMyBooksBloc>(context).add(
                MyBooksBookshelfDeleteEvent(bookshelfID: myBooksID)
            );
          }
        else
          {
            BlocProvider.of<ManagementMyBooksBloc>(context).add(
                MyBooksVocabularyDeleteEvent(vocabularyID: myBooksID)
            );
          }
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
        switch(status)
        {
          case ManagementMyBooksStatus.BOOKSHELF_ADD:
            event = MyBooksBookshelfCreateEvent(
                name: name,
                color: CommonUtils.getInstance(context).getMyBooksColorText(myBooksColorType));
            break;
          case ManagementMyBooksStatus.VOCABULARY_ADD:
            event = MyBooksVocabularyCreateEvent(
                name: name,
                color: CommonUtils.getInstance(context).getMyBooksColorText(myBooksColorType));
            break;
          case ManagementMyBooksStatus.BOOKSHELF_MODIFY:
            event = MyBooksBookshelfUpdateEvent(
                bookshelfID: myBooksID,
                name: name,
                color: CommonUtils.getInstance(context).getMyBooksColorText(myBooksColorType));
            break;
          case ManagementMyBooksStatus.VOCABULARY_MODIFY:
            event = MyBooksVocabularyUpdateEvent(
                vocabularyID: myBooksID,
                name: name,
                color: CommonUtils.getInstance(context).getMyBooksColorText(myBooksColorType));
            break;
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