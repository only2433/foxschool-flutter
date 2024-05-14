import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainMyBooksTypeCubit.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/main/my_book/MyBookshelfResult.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/enum/BookColor.dart';
import 'package:foxschool/enum/MyBooksType.dart';
import 'package:foxschool/enum/UserType.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:foxschool/view/widget/ToggleTextButton.dart';

import '../../../../bloc/main/MainFactoryController.dart';
import '../../../../bloc/main/factory/state/MyBooksTypeState.dart';
import '../../../../common/CommonUtils.dart';
import '../../../../di/Dependencies.dart';
import '../../../../values/AppColors.dart';
import '../../../widget/RobotoBoldText.dart';

class MainMyBooksSubScreen extends StatelessWidget {
  final MainFactoryController factoryController;
  const MainMyBooksSubScreen({
    super.key,
    required this.factoryController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.color_f5f5f5,
      child: Column(
        children: [
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(40),
          ),
          ToggleTextButton(
              width: CommonUtils.getInstance(context).getWidth(660),
              height: CommonUtils.getInstance(context).getHeight(96),
              firstButtonText: getIt<FoxschoolLocalization>().data['text_bookshelf'],
              secondButtonText: getIt<FoxschoolLocalization>().data['text_vocabulary'],
              type: UserType.STUDENT,
              onSelected: (index) {

                if(index == 0)
                  {
                    factoryController.onClickMyBooksType(MyBooksType.BOOKSHELF);
                  }
                else
                  {
                    factoryController.onClickMyBooksType(MyBooksType.VOCABULARY);
                  }
              },
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(40),
          ),
          Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.color_ffffff,
                child: BlocBuilder<MainMyBooksTypeCubit, MyBooksTypeState>(builder: (context, state)
                {
                  List<Widget> containers = [];

                  if(state.type == MyBooksType.BOOKSHELF)
                    {
                      for(int i = 0 ; i < state.bookshelfList.length; i++)
                        {
                          containers.add(
                              _bookshelfItemWidget(context, state.bookshelfList[i])
                          );
                        }
                      containers.add(
                        _addItemWidget(context, MyBooksType.BOOKSHELF)
                      );
                    }
                  else
                    {
                      for(int i = 0 ; i < state.vocabularyList.length; i++)
                      {
                        containers.add(
                            _vocabularyItemWidget(context, state.vocabularyList[i])
                        );
                      }
                      containers.add(
                          _addItemWidget(context, MyBooksType.VOCABULARY)
                      );
                    }
                  return Column(
                    children: containers
                  );
                },),
              )
          )
        ],
      ),
    );
  }

  Widget _bookshelfItemWidget(BuildContext context, MyBookshelfResult item)
  {
    Logger.d("data : " + item.toString());
    BookColor color = CommonUtils.getInstance(context).getBookColorType(item.color);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(172),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(170),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(95)),
              child: Row(
                children: [
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(94),
                    height: CommonUtils.getInstance(context).getHeight(106),
                    child: Stack(
                      children: [
                        Image.asset(CommonUtils.getInstance(context).getBookResource(color),
                            width: CommonUtils.getInstance(context).getWidth(94),
                            height: CommonUtils.getInstance(context).getHeight(106),
                            fit: BoxFit.cover),
                        Positioned(
                          top: CommonUtils.getInstance(context).getWidth(19),
                          left: CommonUtils.getInstance(context).getWidth(25),
                          child: Image.asset('assets/image/icon_bookshelf.png',
                              width: CommonUtils.getInstance(context).getWidth(54),
                              height: CommonUtils.getInstance(context).getHeight(54),
                              fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(19),
                  ),
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(660),
                    child: RobotoNormalText(
                      text: '${item.name} (${item.contentsCount})',
                      fontSize: CommonUtils.getInstance(context).getWidth(40),
                      color: AppColors.color_444444,
                    ),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(40),
                  ),
                  Image.asset('assets/image/icon_setting_g.png',
                    width: CommonUtils.getInstance(context).getWidth(63),
                    height: CommonUtils.getInstance(context).getHeight(63),
                    fit: BoxFit.cover,)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(28)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(2),
              color: AppColors.color_dbdada,
            ),
          )
        ],
      ),
    );
  }

  Widget _vocabularyItemWidget(BuildContext context, MyVocabularyResult item)
  {
    Logger.d("data : " + item.toString());
    BookColor color = CommonUtils.getInstance(context).getBookColorType(item.color);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(172),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(170),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(95)),
              child: Row(
                children: [
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(94),
                    height: CommonUtils.getInstance(context).getHeight(106),
                    child: Stack(
                      children: [
                        Image.asset(CommonUtils.getInstance(context).getBookResource(color),
                            width: CommonUtils.getInstance(context).getWidth(94),
                            height: CommonUtils.getInstance(context).getHeight(106),
                            fit: BoxFit.cover),
                        Positioned(
                          top: CommonUtils.getInstance(context).getWidth(19),
                          left: CommonUtils.getInstance(context).getWidth(25),
                          child: Image.asset('assets/image/icon_voca.png',
                              width: CommonUtils.getInstance(context).getWidth(54),
                              height: CommonUtils.getInstance(context).getHeight(54),
                              fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(19),
                  ),
                  Container(
                    width: CommonUtils.getInstance(context).getWidth(660),
                    child: RobotoNormalText(
                      text: '${item.name} (${item.wordsCount})',
                      fontSize: CommonUtils.getInstance(context).getWidth(40),
                      color: AppColors.color_444444,
                    ),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(40),
                  ),
                  Image.asset('assets/image/icon_setting_g.png',
                    width: CommonUtils.getInstance(context).getWidth(63),
                    height: CommonUtils.getInstance(context).getHeight(63),
                    fit: BoxFit.cover,)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(28)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(2),
              color: AppColors.color_dbdada,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addItemWidget(BuildContext context, MyBooksType type)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(220),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(40),
          ),
          Image.asset('assets/image/btn_add.png',
          width: CommonUtils.getInstance(context).getWidth(87),
          height: CommonUtils.getInstance(context).getHeight(87)
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(10),
          ),
          RobotoNormalText(
              text: type == MyBooksType.BOOKSHELF ?
              getIt<FoxschoolLocalization>().data['text_add_bookshelf']
              : getIt<FoxschoolLocalization>().data['text_add_vocabulary'],
              fontSize: CommonUtils.getInstance(context).getWidth(40),
              color: AppColors.color_b7b7b7,)
        ],
      ),
    );
  }
}
