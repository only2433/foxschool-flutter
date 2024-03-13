import 'package:flutter/material.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:foxschool/view/widget/RobotoRegularText.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';

class LightBlueTextButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;

  const LightBlueTextButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: AppColors.color_26d0df,
          borderRadius: BorderRadius.circular(25)
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: RobotoNormalText(
            text: text,
            fontSize: CommonUtils.getInstance(context).getWidth(40),
          ),
        ),
      ),

    );
  }
}
