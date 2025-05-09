
import 'package:flutter/material.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/values/AppColors.dart';
import 'RobotoNormalText.dart';

class IconTextColumnWidget extends StatelessWidget {
  final double width;
  final double height;
  final double imageWidth;
  final double imageHeight;
  final String imagePath;
  final String title;
  const IconTextColumnWidget({
    super.key,
    required this.width,
    required this.height,
    required this.imageWidth,
    required this.imageHeight,
    required this.imagePath,
    required this.title}
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: imageWidth,
            height: imageHeight,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(10),
          ),
          RobotoNormalText(
              text: title,
              fontSize: CommonUtils.getInstance(context).getHeight(34),
              color: AppColors.color_444444
          )
        ],
      ),
    );
  }
}
