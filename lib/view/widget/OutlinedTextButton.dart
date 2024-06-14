import 'package:flutter/material.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:foxschool/view/widget/RobotoRegularText.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';

class OutlinedTextButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const OutlinedTextButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    this.color = AppColors.color_3370de,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
              color: color,
              width: CommonUtils.getInstance(context).getWidth(2)
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: RobotoNormalText(
            text: text,
            fontSize: CommonUtils.getInstance(context).getWidth(42),
            color: color,
          ),
        ),
      ),

    );
  }
}
