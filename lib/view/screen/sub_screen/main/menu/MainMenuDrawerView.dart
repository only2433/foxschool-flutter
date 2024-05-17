import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/MainMenuDrawerType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/view/widget/GreenOutlinedTextButton.dart';
import 'package:foxschool/view/widget/IconTextColumnWidget.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../../../../common/CommonUtils.dart';
import '../../../../../di/Dependencies.dart';

class MainMenuDrawerView extends StatelessWidget {
  final String userName;
  final String userClass;
  final Function(MainMenuDrawerType type) onSelected;

  const MainMenuDrawerView({super.key, required this.userName, required this.userClass, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    Logger.d("userName : $userName , userClass : $userClass");
    return Stack(
       children: [
         ListView(
           padding: EdgeInsets.zero,
           children: <Widget>[
             Container(
               height: CommonUtils.getInstance(context).getHeight(360),
               color: AppColors.color_23cc8a,
               child: SafeArea(
                 child: Padding(
                   padding: EdgeInsets.only(left: CommonUtils.getInstance(context).getWidth(80), top: CommonUtils.getInstance(context).getHeight(40)),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           RobotoNormalText(text: userName, fontSize: CommonUtils.getInstance(context).getWidth(50)),
                           SizedBox(
                             width: CommonUtils.getInstance(context).getWidth(10),
                           ),
                           RobotoNormalText(text: userClass, fontSize: CommonUtils.getInstance(context).getWidth(42)),
                         ],
                       ),
                       SizedBox(
                         height: CommonUtils.getInstance(context).getHeight(20),
                       ),
                       GreenOutlinedTextButton(
                         width: CommonUtils.getInstance(context).getWidth(250),
                         height: CommonUtils.getInstance(context).getHeight(100),
                         text: getIt<FoxschoolLocalization>().data['text_my_info'],
                         onPressed: () {},
                       )
                     ],
                   ),
                 ),
               ),
             ),
             _buildCenterSelectItemLayout(context),
             _buildBottomSelectItemLayout(context)
           ],
         ),
         Positioned(
            bottom: 0,
             child: GestureDetector(
               onTap: () {
                 onSelected(MainMenuDrawerType.LOG_OUT);
               },
                 child: _buildLogoutButton(context)
             )
         )
       ],
    );
  }

  Widget _buildLogoutButton(BuildContext context)
  {
    return Container(
      width: CommonUtils.getInstance(context).getHeight(824),
      height: CommonUtils.getInstance(context).getHeight(150),
      color: AppColors.color_edeef2,
      alignment: Alignment.center,
      child: RobotoNormalText(
        text: getIt<FoxschoolLocalization>().data['text_logout'],
        fontSize: CommonUtils.getInstance(context).getWidth(42),
        color: AppColors.color_444444,
      ),
    );
  }

  Widget _buildCenterSelectItemLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(280),
      child: Padding(
        padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(40)),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: CommonUtils.getInstance(context).getWidth(2),
                color: AppColors.color_cccccc,
              ),
              borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  onSelected(MainMenuDrawerType.STUDY_LOG);
                },
                child: _buildIconTextWidget(context,
                    'assets/image/main_option_icon_1.png',
                    getIt<FoxschoolLocalization>().data['text_learning_log']
                ),
              ),
              Container(
                color: AppColors.color_444444,
                width: CommonUtils.getInstance(context).getWidth(1),
                height: CommonUtils.getInstance(context).getHeight(200),
              ),
              _buildIconTextWidget(context,
                  'assets/image/main_option_icon_2.png',
                  getIt<FoxschoolLocalization>().data['text_record_history']
              ),
              Container(
                color: AppColors.color_444444,
                width: CommonUtils.getInstance(context).getWidth(1),
                height: CommonUtils.getInstance(context).getHeight(200),
              ),
              _buildIconTextWidget(context,
                  'assets/image/main_option_icon_3.png',
                  getIt<FoxschoolLocalization>().data['text_homework_manage']
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSelectItemLayout(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(40)),
        child: Column(
          children: [
            SizedBox(
              height: CommonUtils.getInstance(context).getWidth(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconTextWidget(context,
                    'assets/image/main_option_icon_5.png',
                    getIt<FoxschoolLocalization>().data['text_foxschool_news']
                ),
                _buildIconTextWidget(context,
                    'assets/image/main_option_icon_6.png',
                    getIt<FoxschoolLocalization>().data['text_faqs']
                ),
                _buildIconTextWidget(context,
                    'assets/image/main_option_icon_7.png',
                    getIt<FoxschoolLocalization>().data['text_1_1_ask']
                )
              ],
            ),
            SizedBox(
              height: CommonUtils.getInstance(context).getWidth(40),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconTextWidget(context,
                      'assets/image/main_option_icon_8.png',
                      getIt<FoxschoolLocalization>().data['text_about_app']),

                  _buildIconTextWidget(context,
                      'assets/image/main_option_icon_9.png',
                      getIt<FoxschoolLocalization>().data['text_teacher_manual']),

                  _buildIconTextWidget(context,
                      'assets/image/main_option_icon_10.png',
                      getIt<FoxschoolLocalization>().data['text_home_newspaper']
              )
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildIconTextWidget(BuildContext context, String imagePath, String title)
  {
    return IconTextColumnWidget(
        width: CommonUtils.getInstance(context).getWidth(237),
        height: CommonUtils.getInstance(context).getWidth(200),
        imageWidth: CommonUtils.getInstance(context).getWidth(76),
        imageHeight: CommonUtils.getInstance(context).getHeight(85),
        imagePath: imagePath,
        title: title
    );
  }
}
