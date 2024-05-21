


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/data/contents/contents_base/ContentsBaseResult.dart';
import 'package:foxschool/enum/ContentsItemType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/view/widget/IconTextColumnWidget.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../di/Dependencies.dart';
import '../../enum/DeviceType.dart';
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

    return  Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6
      ),
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
          indexColor == "" ? _buildTitleWidget(context) : _buildTitleAndIndexWidget(context)
        ],
      ),
    );
  }

  Widget _buildTitleAndIndexWidget(BuildContext context)
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

  Widget _buildTitleWidget(BuildContext context)
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
    return FutureBuilder<List<ContentsItemType>>(
        future: _getHasContentItemTypeList(context),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.color_47e1ad,
                ),
              );
            }
          else
            {
              return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1.4,
                  padding: EdgeInsets.only(
                    top: CommonUtils.getInstance(context).getHeight(60)
                  ),
                  children: _buildContentItemWidget(context, snapshot.data!)
              );
            }
        },);

  }


  List<Widget> _buildContentItemWidget(BuildContext context, List<ContentsItemType> list)
  {
    List<ContentsItemType> itemTypeList =  list;

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

  Future<List<ContentsItemType>> _getHasContentItemTypeList(BuildContext context) async
  {
    List<ContentsItemType> result = [];
    int androidSDKInt = await CommonUtils.getInstance(context).getSDKInt();
    if(data.serviceInfo?.ebookSupportType == Common.SERVICE_SUPPORTED_PAID)
      {
        result.add(ContentsItemType.EBOOK);
      }

    if(data.serviceInfo?.quizSupportType == Common.SERVICE_SUPPORTED_PAID)
      {
        result.add(ContentsItemType.QUIZ);
      }

    if(data.serviceInfo?.vocabularySupportType == Common.SERVICE_SUPPORTED_PAID)
    {
      result.add(ContentsItemType.VOCABULARY);
    }

    if(data.serviceInfo?.flashcardSupportType == Common.SERVICE_SUPPORTED_PAID)
    {
      result.add(ContentsItemType.FLASHCARD);
    }

    if(androidSDKInt >= 23)
      {
        if(data.serviceInfo?.starwordsSupportType == Common.SERVICE_SUPPORTED_PAID)
        {
          result.add(ContentsItemType.STARWORDS);
        }
        if(data.serviceInfo?.crosswordSupportType == Common.SERVICE_SUPPORTED_PAID)
        {
          result.add(ContentsItemType.CROSSWORD);
        }
      }

    if(data.serviceInfo?.recordSupportType == Common.SERVICE_SUPPORTED_PAID)
    {
      result.add(ContentsItemType.RECORDER);
    }

    if(data.serviceInfo?.originalTextSupportType == Common.SERVICE_SUPPORTED_PAID)
    {
      result.add(ContentsItemType.TRANSLATE);
    }

    if(isDisableBookshelf == false)
      {
        result.add(ContentsItemType.BOOKSHELF);
      }

    return result;
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
        return 'assets/image/learning_06.png';
      case ContentsItemType.QUIZ:
        return 'assets/image/learning_01.png';
      case ContentsItemType.VOCABULARY:
        return 'assets/image/learning_03.png';
      case ContentsItemType.FLASHCARD:
        return 'assets/image/learning_08.png';
      case ContentsItemType.STARWORDS:
        return 'assets/image/learning_07.png';
      case ContentsItemType.CROSSWORD:
        return 'assets/image/learning_09.png';
      case ContentsItemType.RECORDER:
        return 'assets/image/learning_10.png';
      case ContentsItemType.TRANSLATE:
        return 'assets/image/learning_02.png';
      case ContentsItemType.BOOKSHELF:
        return isDeleteItemInBookshelf ? 'assets/image/learning_05.png' : 'assets/image/learning_04.png';
      default:
        return 'assets/image/learning_01.png';
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
