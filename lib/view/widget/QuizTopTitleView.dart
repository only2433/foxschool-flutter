import 'package:flutter/material.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';

import '../../common/CommonUtils.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../di/Dependencies.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../values/AppColors.dart';

class QuizTopTitleView extends StatelessWidget {
  final VoidCallback onPressed;
  const QuizTopTitleView({super.key,
    required this.onPressed});

  @override
  Widget build(BuildContext context)
  {
    return _buildCloseButtonWidget(context);
  }


  Widget _buildCloseButtonWidget(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(100),
      color: AppColors.color_23cc8a,
      child: Stack(
        children: [
          Center(
            child: Text( getIt<FoxschoolLocalization>().data['title_quiz'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: CommonUtils.getInstance(context).getWidth(34),
                  fontFamily: 'Roboto'
              ),),
          ),
          Positioned(
            top: CommonUtils.getInstance(context).getWidth(20),
            right: CommonUtils.getInstance(context).getWidth(50),
            child: GestureDetector(
                onTap: onPressed,
                child: Icon(Icons.close, color: Colors.white,
                  size: CommonUtils.getInstance(context).getWidth(50),)
            ),
          ),
        ],
      ),
    );
  }
}
