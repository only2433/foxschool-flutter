
import 'package:flutter/material.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/values/AppColors.dart';

class ContentsListItemView extends StatelessWidget {

  final String thumbnailUrl;
  final String title;
  final VoidCallback onThumbnailPressed;
  String indexColor;
  int index;
  bool isStoryViewComplete;
  VoidCallback? onOptionPressed;

  ContentsListItemView({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.onThumbnailPressed,
    this.indexColor = "",
    this.index = 0,
    this.isStoryViewComplete = false,
    onOptionPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: CommonUtils.getInstance(context).getHeight(244),
        decoration: BoxDecoration(
          color: AppColors.color_ffffff,
          borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(20)),
          border: Border.all(
            color: AppColors.color_f5f5f5,
            width: CommonUtils.getInstance(context).getWidth(1)
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                offset: Offset(0,2),
                color: Colors.grey.withOpacity(0.2)
            )
          ]
        ),
    );
  }
}


