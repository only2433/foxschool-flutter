
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxschool/data/main/my_vocabulary/MyVocabularyResult.dart';
import 'package:foxschool/enum/MyBooksType.dart';

import '../../common/CommonUtils.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../data/main/my_book/MyBookshelfResult.dart';
import '../../di/Dependencies.dart';
import '../../values/AppColors.dart';
import 'RobotoNormalText.dart';

class BottomAddBookWidget extends StatelessWidget {
  final MyBooksType bookType;
  final List<MyVocabularyResult> vocabularyList;
  final Function(int index) onItemPressed;
  BottomAddBookWidget({
    super.key,
    required this.bookType,
    required this.vocabularyList,
    required this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(842),
      color: AppColors.color_ffffff,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getWidth(142),
            child: Row(
              children: [
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(40),
                ),
                RobotoNormalText(
                  text: getIt<FoxschoolLocalization>().data['text_select_vocabulary'],
                  fontSize: CommonUtils.getInstance(context).getWidth(48),
                  color: AppColors.color_000000,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(2),
            color: AppColors.color_b9b9b9,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(680),
            child: ListView.builder(
              itemCount: vocabularyList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    onItemPressed(index);
                  },
                  child: _buildSelectItem(
                      context: context,
                      color: vocabularyList[index].color,
                      title: vocabularyList[index].name,
                      itemCount: vocabularyList[index].wordsCount),
                );
            },),

          )
        ],
      ),
    );
  }

  Widget _buildSelectItem({required BuildContext context, required String color, required String title, required int itemCount})
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(172),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(95)),
            child: Row(
              children: [
                SizedBox(
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
                  width: CommonUtils.getInstance(context).getWidth(30),
                ),
                Container(
                  width: CommonUtils.getInstance(context).getWidth(660),
                  height: CommonUtils.getInstance(context).getHeight(170),
                  alignment: Alignment.centerLeft,
                  child: RobotoNormalText(
                      text: '$title($itemCount)',
                      fontSize: CommonUtils.getInstance(context).getWidth(40),
                      color: AppColors.color_444444),
                )
              ],
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
}
