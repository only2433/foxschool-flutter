import 'package:flutter/material.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';

class BottomIconTextView extends StatelessWidget {

  final double width;
  final double height;
  final String imageAssetUri;
  final double imageWidth;
  final double imageHeight;
  final String title;
  final bool isPlaying;
  final VoidCallback? onPressed;
  const BottomIconTextView({
    super.key,
    this.width = 0,
    this.height = 0,
    required this.imageAssetUri,
    this.imageWidth = 0,
    this.imageHeight = 0,
    required this.title, 
    required this.onPressed,
    this.isPlaying = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width == 0 ? CommonUtils.getInstance(context).getWidth(270) : width,
        height: height == 0 ? CommonUtils.getInstance(context).getHeight(176) : height,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                imageAssetUri,
                width: imageWidth == 0 ? CommonUtils.getInstance(context).getWidth(210) : imageWidth,
                height: imageHeight == 0 ? CommonUtils.getInstance(context).getHeight(90) : imageHeight,
                fit: BoxFit.cover,
                color: isPlaying ? Colors.white.withOpacity(0.4) : null,
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(20),
            ),
            RobotoNormalText(
                text: title,
                fontSize: CommonUtils.getInstance(context).getWidth(32),
                color: isPlaying ? Colors.white.withOpacity(0.4) : AppColors.color_ffffff,
            )
          ],
        ),
      ),
    );
  }
}
