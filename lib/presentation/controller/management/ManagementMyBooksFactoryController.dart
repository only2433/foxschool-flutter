
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxschool/data/model/management/ManagementMyBooksData.dart';
import 'package:foxschool/domain/repository/FoxSchoolRepository.dart';
import 'package:foxschool/presentation/bloc/base/BlocController.dart';
import 'package:foxschool/presentation/bloc/base/BlocEvent.dart';
import 'package:foxschool/presentation/bloc/base/BlocState.dart';

import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/MainObserver.dart';
import 'package:foxschool/data/model/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/model/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/controller/management/river_pod/ManagementMyBooksAPINotifier.dart';
import 'package:foxschool/presentation/controller/management/river_pod/ManagementMyBooksUINotifier.dart';
import 'package:foxschool/presentation/view/dialog/LoadingDialog.dart' as LoadingDialog;
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/common/PageNavigator.dart' as Page;
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/presentation/view/dialog/FoxSchoolDialog.dart' as FoxSchoolDialog;
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/model/main/MainInformationResult.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/ManagementMyBooksStatus.dart';
import 'package:foxschool/enum/MyBooksColorType.dart';


class ManagementMyBooksFactoryController extends BlocController
{
  late StreamSubscription _subscription;
  late MainInformationResult _mainData;
  late ManagementMyBooksAPINotifierProvider _repositoryProvider;
  final BuildContext context;
  final ManagementMyBooksData myBooksData;
  final WidgetRef widgetRef;
  ManagementMyBooksFactoryController({
    required this.context,
    required this.myBooksData,
    required this.widgetRef
  });

  @override
  void init() async
  {
    _repositoryProvider = ManagementMyBooksAPINotifierProvider(getIt<FoxSchoolRepository>());
    _settingRequestDataNotifier();
    Future.delayed(Duration.zero, (){
      widgetRef.read(managementMyBooksUINotifierProvider.notifier).setBookTitle(
          _getTitle()
      );
      widgetRef.read(managementMyBooksUINotifierProvider.notifier).setButtonText(
          _getButtonText()
      );
      if(myBooksData.name != "")
        {
          widgetRef.read(managementMyBooksUINotifierProvider.notifier).setBookName(
            myBooksData.name
          );
        }
      onSelectBookColor(myBooksData.colorType);
    });
    await _getMainData();
  }

  void _settingRequestDataNotifier()
  {
    widgetRef.listenManual(_repositoryProvider, (previous, next) {
      next.when(
          common: (state){
            state.maybeWhen(
                loadingState: (){
                  LoadingDialog.show(context);
                },
                errorState: (message){
                  LoadingDialog.dismiss(context);
                  Fluttertoast.showToast(msg: message);
                },
                authenticationErrorState: (isAutoRestart, message) async{
                  LoadingDialog.dismiss(context);
                  if(isAutoRestart == false)
                  {
                    await Preference.setBoolean(Common.PARAMS_IS_AUTO_LOGIN_DATA, false);
                    await Preference.setString(Common.PARAMS_ACCESS_TOKEN, "");
                  }
                  Fluttertoast.showToast(msg: message);
                  Navigator.pushAndRemoveUntil(
                    context,
                    Page.getIntroTransition(context),
                        (route) => false,
                  );
                },
                orElse: (){}
            );
          },
          createBookshelf: (data) async {
            await _createMyBooksBookshelf(data);
            LoadingDialog.dismiss(context);
            await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
              onBackPressed();
            });
          },
          createVocabulary: (data) async{
            await _createMyBooksVocabulary(data);
            LoadingDialog.dismiss(context);
            await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
              onBackPressed();
            });
          },
          updateBookshelf: (data) async{
            await _updateMyBooksBookshelf(data);
            LoadingDialog.dismiss(context);
            await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
              onBackPressed();
            });
          },
          updateVocabulary: (data) async{
            await _updateMyBooksVocabulary(data);
            LoadingDialog.dismiss(context);
            await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
              onBackPressed();
            },);
          },
          deleteBookshelf: () async{
            await _deleteMyBooksBookshelf();
            LoadingDialog.dismiss(context);
            await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
              onBackPressed();
            });
          },
          deleteVocabulary: () async{
            await _deleteMyBooksVocabulary();
            LoadingDialog.dismiss(context);
            await Future.delayed(const Duration(milliseconds: Common.DURATION_NORMAL), () {
              onBackPressed();
            });
          }
      );
    });
  }

  Future<void> _getMainData() async
  {
    Object? mainObject = await Preference.getObject(Common.PARAMS_FILE_MAIN_INFO);
    _mainData = MainInformationResult.fromJson(mainObject as Map<String, dynamic>);
  }

  void _notifyMyBooks(MyBooksType type)
  {
    widgetRef.read(mainUINotifierProvider.notifier).setMyBooksTypeList(        
        type,
        _mainData.bookshelfList,
        _mainData.vocabularyList);
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
        if(dataList[i].id == myBooksData.id)
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
        if(dataList[i].id == myBooksData.id)
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
      message: myBooksData.status == ManagementMyBooksStatus.BOOKSHELF_MODIFY ? getIt<FoxschoolLocalization>().data['message_delete_bookshelf'] : getIt<FoxschoolLocalization>().data['message_delete_vocabulary'],
      buttonText: getIt<FoxschoolLocalization>().data['text_confirm'],
      onSelected: () {
        if(myBooksData.status == ManagementMyBooksStatus.BOOKSHELF_MODIFY)
          {
            widgetRef.read(_repositoryProvider.notifier).requestDeleteBookshelf(myBooksData.id);
          }
        else
          {
            widgetRef.read(_repositoryProvider.notifier).requestDeleteVocabulary(myBooksData.id);
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
    myBooksData.colorType = type;
    widgetRef.read(managementMyBooksUINotifierProvider.notifier).setBookColorType(type);
  }

  void onClickSaveButton(String name)
  {
    Logger.d("");
    BlocEvent event;
    if(name != "")
      {
        switch(myBooksData.status)
        {
          case ManagementMyBooksStatus.BOOKSHELF_ADD:
            widgetRef.read(_repositoryProvider.notifier).requestCreateBookshelf(
                name,
                CommonUtils.getInstance(context).getMyBooksColorText(myBooksData.colorType));
            break;
          case ManagementMyBooksStatus.VOCABULARY_ADD:
            widgetRef.read(_repositoryProvider.notifier).requestCreateVocabulary(
                name,
                CommonUtils.getInstance(context).getMyBooksColorText(myBooksData.colorType));
            break;
          case ManagementMyBooksStatus.BOOKSHELF_MODIFY:
            widgetRef.read(_repositoryProvider.notifier).requestUpdateBookshelf(
                myBooksData.id,
                name,
                CommonUtils.getInstance(context).getMyBooksColorText(myBooksData.colorType));
            break;
          case ManagementMyBooksStatus.VOCABULARY_MODIFY:
            widgetRef.read(_repositoryProvider.notifier).requestUpdateVocabulary(
                myBooksData.id,
                name,
                CommonUtils.getInstance(context).getMyBooksColorText(myBooksData.colorType));
            break;
        }
      }
    else
      {
        Fluttertoast.showToast(msg: getIt<FoxschoolLocalization>().data['message_warning_empty_bookshelf_name']);
      }
  }

  void onClickCancelButton()
  {
    if(myBooksData.status == ManagementMyBooksStatus.BOOKSHELF_MODIFY || myBooksData.status == ManagementMyBooksStatus.VOCABULARY_MODIFY)
      {
        _showDeleteVocabularyAction();
      }
    else
      {
        onBackPressed();
      }
  }

  String _getTitle()
  {
    switch(myBooksData.status)
    {
      case ManagementMyBooksStatus.BOOKSHELF_ADD:
        return getIt<FoxschoolLocalization>().data['text_add_bookshelf'];
      case ManagementMyBooksStatus.BOOKSHELF_MODIFY:
        return getIt<FoxschoolLocalization>().data['text_manage_bookshelf'];
      case ManagementMyBooksStatus.VOCABULARY_ADD:
        return getIt<FoxschoolLocalization>().data['text_add_vocabulary'];
      case ManagementMyBooksStatus.VOCABULARY_MODIFY:
        return getIt<FoxschoolLocalization>().data['text_manage_vocabulary'];
    }
  }

  String _getButtonText()
  {
    switch(myBooksData.status)
    {
      case ManagementMyBooksStatus.BOOKSHELF_ADD:
      case ManagementMyBooksStatus.VOCABULARY_ADD:
        return getIt<FoxschoolLocalization>().data['text_cancel'];
      case ManagementMyBooksStatus.BOOKSHELF_MODIFY:
      case ManagementMyBooksStatus.VOCABULARY_MODIFY:
        return getIt<FoxschoolLocalization>().data['text_delete'];
    }
  }

}