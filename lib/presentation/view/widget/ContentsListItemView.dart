
import 'package:flutter/material.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentsListItemView extends StatelessWidget {

  final String thumbnailUrl;
  final String title;

  final VoidCallback  onThumbnailPressed;
  String indexColor;
  int index;
  bool isSelected;
  bool isStoryViewComplete;
  VoidCallback? onItemPressed;
  VoidCallback? onOptionPressed;

  ContentsListItemView({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.onThumbnailPressed,
    this.indexColor = "",
    this.index = 0,
    this.isSelected = false,
    this.isStoryViewComplete = false,
    this.onItemPressed,
    this.onOptionPressed
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if(onItemPressed != null)
          {
            onItemPressed!();
          }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: CommonUtils.getInstance(context).getHeight(244),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.color_ffe84d : AppColors.color_ffffff,
            borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
            border: Border.all(
                color: AppColors.color_f5f5f5,
                width: CommonUtils.getInstance(context).getWidth(1)
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  offset: const Offset(0,0),
                  color: Colors.grey.withOpacity(0.5)
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: CommonUtils.getInstance(context).getWidth(28),
            ),
            GestureDetector(
              onTap: () {
                onThumbnailPressed(); // 이 부분이 호출되어야 함
              },
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: thumbnailUrl,
                width: CommonUtils.getInstance(context).getWidth(324),
                height: CommonUtils.getInstance(context).getHeight(182),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: CommonUtils.getInstance(context).getWidth(36),
            ),
            indexColor == "" ? _buildTitleWidget(context) : _buildTitleAndIndexWidget(context),
            GestureDetector(
              onTap: () {
                if(onOptionPressed != null)
                  {
                    onOptionPressed!();
                  }
              },
              child: SizedBox(
                width: CommonUtils.getInstance(context).getWidth(92),
                height: CommonUtils.getInstance(context).getHeight(125),
                child: Image.asset('assets/image/icon_learning.png',
                    width: CommonUtils.getInstance(context).getHeight(92),
                    height: CommonUtils.getInstance(context).getHeight(125)),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _buildTitleAndIndexWidget(BuildContext context)
  {
    return SizedBox(
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
              text: title,
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
        text: title,
        fontSize: CommonUtils.getInstance(context).getWidth(40),
        color: AppColors.color_444444,
        maxLines: 3,
      ),
    );
  }

  String _getIndexText(int index)
  {
    if(index < 10)
      {
        return '0$index';
      }
    else
      {
        return '$index';
      }
  }
}


