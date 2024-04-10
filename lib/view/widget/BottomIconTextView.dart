import 'package:flutter/material.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';

class BottomIconTextView extends StatelessWidget {
  
  final Widget image;
  final String title;
  final VoidCallback onPressed;
  const BottomIconTextView({
    super.key, 
    required this.image, 
    required this.title, 
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: CommonUtils.getInstance(context).getWidth(270),
        height: CommonUtils.getInstance(context).getHeight(176),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image,
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(20),
            ),
            RobotoNormalText(
                text: title,
                fontSize: CommonUtils.getInstance(context).getWidth(32)
            )
          ],
        ),
      ),
    );
  }
}
