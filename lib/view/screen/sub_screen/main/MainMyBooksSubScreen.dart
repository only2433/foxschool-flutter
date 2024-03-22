import 'package:flutter/material.dart';

import '../../../../common/CommonUtils.dart';
import '../../../../values/AppColors.dart';
import '../../../widget/RobotoBoldText.dart';

class MainMyBooksSubScreen extends StatelessWidget {
  const MainMyBooksSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RobotoBoldText(
          text: "나의 책장",
          fontSize: CommonUtils.getInstance(context).getWidth(50),
          color: AppColors.color_000000,
        ),
      ),
    );
  }
}
