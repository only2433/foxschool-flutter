import 'package:flutter/material.dart';

import '../../../../common/CommonUtils.dart';
import '../../../../values/AppColors.dart';
import '../../../widget/RobotoBoldText.dart';

class MainSongSubScreen extends StatelessWidget {
  const MainSongSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RobotoBoldText(
          text: "동요",
          fontSize: CommonUtils.getInstance(context).getWidth(50),
          color: AppColors.color_000000,
        ),
      ),
    );
  }
}
