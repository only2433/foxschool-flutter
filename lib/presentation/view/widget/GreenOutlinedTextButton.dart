import 'package:flutter/material.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/values/AppColors.dart';

class GreenOutlinedTextButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;

  const GreenOutlinedTextButton({
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
          border: Border.all(
              color: AppColors.color_23cc8a,
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
            color: AppColors.color_23cc8a,
          ),
        ),
      ),

    );
  }
}
