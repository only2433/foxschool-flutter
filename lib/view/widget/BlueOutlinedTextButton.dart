import 'package:flutter/material.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';

class BlueOutlinedTextButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;

  const BlueOutlinedTextButton({
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
              color: AppColors.color_3370de,
              width: CommonUtils.getInstance(context).getWidth(1)
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: CommonUtils.getInstance(context).getWidth(15),
              fontWeight: FontWeight.w200,
              fontFamily: 'Roboto',
              color: AppColors.color_3370de,
            ),
          ),
        ),
      ),

    );
  }
}
