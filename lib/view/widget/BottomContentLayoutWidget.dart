
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/enum/ContentsItemType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/view/widget/IconTextColumnWidget.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../common/CommonUtils.dart';
import '../../di/Dependencies.dart';
import 'RobotoBoldText.dart';
import 'RobotoNormalText.dart';

class BottomContentLayoutWidget extends StatelessWidget {
  final ContentsBaseResult data;
  final int index;
  final bool isFullName;
  final bool isDeleteItemInBookshelf;
  final bool isDisableBookshelf;
  final String indexColor;
  final Function(ContentsItemType type) onItemTypeSelected;

  const BottomContentLayoutWidget({
    super.key,
    required this.data,
    this.index = 0,
    this.isFullName = false,
    this.isDeleteItemInBookshelf = false,
    this.isDisableBookshelf = false,
    this.indexColor = "",
    required this.onItemTypeSelected
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(16)),
            child: Column(
              children: [
                _buildTitleView(context),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: CommonUtils.getInstance(context).getHeight(2),
                  color: AppColors.color_d2d1d1,
                ),
                _buildContentsView(context)
              ],
            ),
          );
        },
    );
  }

  Widget _buildTitleView(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(256),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: CommonUtils.getInstance(context).getWidth(54),
          ),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: data.thumbnailUrl,
            width: CommonUtils.getInstance(context).getWidth(324),
            height: CommonUtils.getInstance(context).getHeight(182),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: CommonUtils.getInstance(context).getWidth(36),
          ),
          indexColor == "" ? _getTitleWidget(context) : _getTitleAndIndexWidget(context)
        ],
      ),
    );
  }

  Widget _getTitleAndIndexWidget(BuildContext context)
  {
    return Container(
      width: CommonUtils.getInstance(context).getWidth(530),
      height: CommonUtils.getInstance(context).getHeight(182),
      child: Row(
        children: [
          Container(
            width: CommonUtils.getInstance(context).getWidth(80),
            height: CommonUtils.getInstance(context).getHeight(182),
            alignment: Alignment.centerLeft,
            child: RobotoBoldText(
              text: _getIndexText(index),
              fontSize: CommonUtils.getInstance(context).getWidth(40),
              color: indexColor == "" ?
              AppColors.color_ffffff
                  : CommonUtils.getInstance(context).colorFromHex(indexColor),

            ),
          ),
          Container(
            width: CommonUtils.getInstance(context).getWidth(450),
            height: CommonUtils.getInstance(context).getHeight(182),
            alignment: Alignment.centerLeft,
            child: RobotoNormalText(
              text: data.getContentsName(),
              fontSize: CommonUtils.getInstance(context).getWidth(40),
              color: AppColors.color_444444,
              maxLines: 3,
            ),
          )
        ],
      ),
    );
  }

  Widget _getTitleWidget(BuildContext context)
  {
    return Container(
      width: CommonUtils.getInstance(context).getWidth(500),
      height: CommonUtils.getInstance(context).getHeight(182),
      alignment: Alignment.centerLeft,
      child: RobotoNormalText(
        text: data.getContentsName(),
        fontSize: CommonUtils.getInstance(context).getWidth(40),
        color: AppColors.color_444444,
        maxLines: 3,
      ),
    );
  }

  Widget _buildContentsView(BuildContext context)
  {
    return GridView.count(
        crossAxisCount: 3,
        children: _getContentsItemList(context)
    );
  }

  List<Widget> _getContentsItemList(BuildContext context)
  {
    List<ContentsItemType> itemTypeList = [ContentsItemType.QUIZ, ContentsItemType.BOOKSHELF];

    return itemTypeList.map((itemType) {
      return GestureDetector(
        onTap: () {
          onItemTypeSelected(itemType);
        },
        child: IconTextColumnWidget(
          width: CommonUtils.getInstance(context).getWidth(282),
          height: CommonUtils.getInstance(context).getHeight(252),
          imageWidth: CommonUtils.getInstance(context).getWidth(120),
          imageHeight: CommonUtils.getInstance(context).getWidth(120),
          imagePath: _getIconImagePath(itemType),
          title: _getIconTextTitle(itemType),
        ),
      );
    }).toList();
  }

  String _getIndexText(int index)
  {
    if(index < 10)
    {
      return '0${index}';
    }
    else
    {
      return '${index}';
    }
  }

  String _getIconImagePath(ContentsItemType type)
  {
    switch(type)
    {
      case ContentsItemType.EBOOK:
        return 'asset/image/learning_06.png';
      case ContentsItemType.QUIZ:
        return 'asset/image/learning_01.png';
      case ContentsItemType.VOCABULARY:
        return 'asset/image/learning_03.png';
      case ContentsItemType.FLASHCARD:
        return 'asset/image/learning_08.png';
      case ContentsItemType.STARWORDS:
        return 'asset/image/learning_07.png';
      case ContentsItemType.CROSSWORD:
        return 'asset/image/learning_09.png';
      case ContentsItemType.RECORDER:
        return 'asset/image/learning_10.png';
      case ContentsItemType.TRANSLATE:
        return 'asset/image/learning_02.png';
      case ContentsItemType.BOOKSHELF:
        return isDeleteItemInBookshelf ? 'asset/image/learning_05.png' : 'asset/image/learning_04.png';
      default:
        return 'asset/image/learning_01.png';
    }
  }

  String _getIconTextTitle(ContentsItemType type)
  {
    switch(type)
    {
      case ContentsItemType.EBOOK:
        return getIt<FoxschoolLocalization>().data['text_ebook'];
      case ContentsItemType.QUIZ:
        return getIt<FoxschoolLocalization>().data['title_quiz'];
      case ContentsItemType.VOCABULARY:
        return getIt<FoxschoolLocalization>().data['text_wordbook'];
      case ContentsItemType.FLASHCARD:
        return getIt<FoxschoolLocalization>().data['text_flashcards'];
      case ContentsItemType.STARWORDS:
        return getIt<FoxschoolLocalization>().data['text_starwords'];
      case ContentsItemType.CROSSWORD:
        return getIt<FoxschoolLocalization>().data['text_crossword'];
      case ContentsItemType.RECORDER:
        return getIt<FoxschoolLocalization>().data['text_recorder'];
      case ContentsItemType.TRANSLATE:
        return getIt<FoxschoolLocalization>().data['text_original_translate'];
      case ContentsItemType.BOOKSHELF:
        return isDeleteItemInBookshelf ? getIt<FoxschoolLocalization>().data['text_delete'] : getIt<FoxschoolLocalization>().data['text_contain_bookshelf'];
      default:
        return getIt<FoxschoolLocalization>().data['text_ebook'];
    }
  }
}
