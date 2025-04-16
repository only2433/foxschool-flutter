
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/values/AppColors.dart';

class QuizExampleTextWidget extends StatelessWidget {
  final String indexImage;
  final String checkImage;
  final String text;
  final VoidCallback onItemPressed;
  final double bottomMargin;
  const QuizExampleTextWidget({
    super.key,
    required this.indexImage,
    required this.checkImage,
    required this.text,
    required this.onItemPressed,
    required this.bottomMargin}
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(110 + bottomMargin),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(110),
                ),
                GestureDetector(
                  onTap: onItemPressed,
                  child: Image.asset(checkImage,
                      width: CommonUtils.getInstance(context).getWidth(50),
                      height: CommonUtils.getInstance(context).getHeight(50)),
                ),
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(25),
                ),
                Image.asset(indexImage,
                  width: CommonUtils.getInstance(context).getWidth(50),
                  height: CommonUtils.getInstance(context).getHeight(50)
                ),
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(10),
                ),
                RobotoNormalText(
                    text: text,
                    fontSize: CommonUtils.getInstance(context).getWidth(40),
                    color: AppColors.color_444444),

              ],
            ),
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(bottomMargin),
          )
        ],
      ),
    );
  }
}
