import 'package:flutter/material.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/values/AppColors.dart';

class MainScreenTitleView extends StatelessWidget {
  final String title;
  final VoidCallback onMenuPressed;
  final VoidCallback onSearchPressed;

  const MainScreenTitleView({super.key,
    required this.title,
    required this.onMenuPressed,
    required this.onSearchPressed});

  @override
  Widget build(BuildContext context)
  {
    return _MainTitleWidget(context);
  }

  Widget _MainTitleWidget(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(145),
      color: AppColors.color_23cc8a,
      child: Stack(
        children: [
          Positioned(
            top: CommonUtils.getInstance(context).getWidth(30),
            left: CommonUtils.getInstance(context).getWidth(40),
            child: GestureDetector(
                onTap: onMenuPressed,
                child: Icon(Icons.menu, color: Colors.white,
                  size: CommonUtils.getInstance(context).getWidth(80),
                )
            ),
          ),
          Center(
            child: RobotoBoldText(
              text: title,
              fontSize: CommonUtils.getInstance(context).getWidth(50),
            ),
          ),
          Positioned(
            top: CommonUtils.getInstance(context).getWidth(35),
            right: CommonUtils.getInstance(context).getWidth(40),
            child: GestureDetector(
                onTap: onSearchPressed,
                child: Icon(Icons.search_outlined, color: Colors.white,
                  size: CommonUtils.getInstance(context).getWidth(80),
                )
            ),
          ),
        ],
      ),
    );
  }
}
