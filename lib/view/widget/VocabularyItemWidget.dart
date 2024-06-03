
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/view/widget/HtmlTextWidget.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';

class VocabularyItemWidget extends StatelessWidget {
  final String title;
  final String mean;
  final String example;
  final bool isEnableTitle;
  final bool isEnableMean;
  final bool isEnableExample;
  final int lineCount;
  final bool isSelected;
  final bool isCurrentPlaying;
  final VoidCallback onItemPressed;
  final VoidCallback onPlayIconPressed;

  const VocabularyItemWidget({
    super.key,
    required this.title, 
    required this.mean, 
    required this.example,
    required this.isEnableTitle,
    required this.isEnableMean,
    required this.isEnableExample,
    required this.lineCount,
    required this.isSelected,
    this.isCurrentPlaying = false,
    required this.onItemPressed,
    required this.onPlayIconPressed});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(30)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                onItemPressed();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:  CommonUtils.getInstance(context).getHeight(132) + CommonUtils.getInstance(context).getVocabularyContentViewSize(lineCount),
                decoration: BoxDecoration(
                  color: isSelected ? isCurrentPlaying ? AppColors.color_fff55a : AppColors.color_d9dede : AppColors.color_ffffff,
                  border: Border.all(
                    color: AppColors.color_999999,
                    width: CommonUtils.getInstance(context).getWidth(1)
                  ),
                  borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(10)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: CommonUtils.getInstance(context).getWidth(790),
                            height: CommonUtils.getInstance(context).getHeight(132),
                            alignment: Alignment.centerLeft,
                            child: RobotoBoldText(
                                text: isEnableTitle ? title : "",
                                color: AppColors.color_2e3192,
                                fontSize: CommonUtils.getInstance(context).getHeight(40),
                            )
                        ),

                        GestureDetector(
                          onTap: () {
                            onPlayIconPressed();
                          },
                          child: Image.asset('assets/image/icon_sound.png',
                            width: CommonUtils.getInstance(context).getWidth(60),
                            height: CommonUtils.getInstance(context).getHeight(60),),
                        ),

                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: CommonUtils.getInstance(context).getHeight(1),
                      color: isSelected ? AppColors.color_ffffff : AppColors.color_999999,
                    ),
                    Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: CommonUtils.getInstance(context).getVocabularyContentViewSize(lineCount),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(40)),
                            child: HtmlTextWidget(
                              text: _getContentsText(),
                              color: AppColors.color_444444,
                              fontSize: CommonUtils.getInstance(context).getHeight(38),
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getHeight(30),
            )
          ],
        )
    );
  }

  String _getContentsText()
  {
    if (isEnableMean)
    {
      if (isEnableExample)
      {
        return "$mean<br>$example";
      }
      else
      {
        return mean;
      }
    }
    else if (isEnableExample)
    {
      return example;
    }
    else
    {
      return "";
    }
  }
}
