import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/UserType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../common/Common.dart';
import '../../di/Dependencies.dart';
import '../../enum/MyBooksType.dart';


class ToggleTextButton extends StatefulWidget {

  final double width;
  final double height;
  final String firstButtonText;
  final String secondButtonText;
  final int selectIndex;
  final Function(int index) onSelected;

  const ToggleTextButton({
    super.key,
    required this.width,
    required this.height,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.selectIndex,
    required this.onSelected});

  @override
  State<ToggleTextButton> createState() => _ToggleTextButtonState();
}

class _ToggleTextButtonState extends State<ToggleTextButton>
{
  @override
  Widget build(BuildContext context) {

    return Container(
      width: widget.width,
      height: widget.height,

      child: Stack(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
              decoration: BoxDecoration(
                  color: AppColors.color_ffffff,
                  borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(60)),
                  border: Border.all(
                      color: AppColors.color_999999,
                      width: CommonUtils.getInstance(context).getWidth(2)
                  )
              )
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    widget.onSelected(0);
                  },
                  child: Container(
                    width: widget.width/2,
                    height: widget.height,
                    alignment: Alignment.center,
                    child: RobotoNormalText(
                      text: widget.firstButtonText,
                      color: widget.selectIndex == 0 ? AppColors.color_26d0df : AppColors.color_999999,
                      fontSize: CommonUtils.getInstance(context).getWidth(40),
                      align: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    widget.onSelected(1);
                  },
                  child: Container(
                    width: widget.width/2,
                    height: widget.height,
                    alignment: Alignment.center,
                    child: RobotoNormalText(
                      text: widget.secondButtonText,
                      color: widget.selectIndex == 1 ? AppColors.color_26d0df : AppColors.color_999999,
                      fontSize: CommonUtils.getInstance(context).getWidth(40),
                      align: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: Common.DURATION_NORMAL),
            curve: Curves.easeInOut,
            left: widget.selectIndex == 0 ? 0 : widget.width/2,
            child: Container(
              width: widget.width/2,
              height: widget.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(60)),
                  border: Border.all(
                      color: AppColors.color_26d0df,
                      width: CommonUtils.getInstance(context).getWidth(4)
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
