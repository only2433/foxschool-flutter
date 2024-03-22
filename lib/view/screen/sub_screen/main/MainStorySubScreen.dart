import 'package:flutter/material.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';

import '../../../../values/AppColors.dart';

class MainStorySubScreen extends StatelessWidget {
  const MainStorySubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RobotoBoldText(
          text: "동화",
          fontSize: CommonUtils.getInstance(context).getWidth(50),
          color: AppColors.color_000000,
        ),
      ),
    );
  }
}
