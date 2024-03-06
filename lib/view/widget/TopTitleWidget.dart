import 'package:flutter/material.dart';

import '../../common/CommonUtils.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../values/AppColors.dart';

class TopTitleWidget extends StatelessWidget {
  final String title;
  final TopTitleButtonType type;
  final VoidCallback onPressed;
  const TopTitleWidget({super.key,
    required this.title,
    required this.type,
    required this.onPressed});

  @override
  Widget build(BuildContext context)
  {
    if(type == TopTitleButtonType.BACK)
      {
        return _BackButtonWidget(context);
      }
    else
      {
        return _CloseButtonWidget(context);
      }
  }

  Widget _BackButtonWidget(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(50),
      color: AppColors.color_23cc8a,
      child: Stack(
        children: [
          Positioned(
            top: CommonUtils.getInstance(context).getWidth(8),
            left: CommonUtils.getInstance(context).getWidth(10),
            child: GestureDetector(
                onTap: onPressed,
                child: Icon(Icons.arrow_back, color: Colors.white,
                  size: CommonUtils.getInstance(context).getWidth(35),)
            ),
          ),
          Center(
            child: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: CommonUtils.getInstance(context).getWidth(18),
                  fontFamily: 'Roboto'
              ),),
          ),

        ],
      ),
    );
  }

  Widget _CloseButtonWidget(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(50),
      color: AppColors.color_23cc8a,
      child: Stack(
        children: [
          Center(
            child: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: CommonUtils.getInstance(context).getWidth(18),
                  fontFamily: 'Roboto'
              ),),
          ),
          Positioned(
            top: CommonUtils.getInstance(context).getWidth(8),
            right: CommonUtils.getInstance(context).getWidth(10),
            child: GestureDetector(
                onTap: onPressed,
                child: Icon(Icons.close, color: Colors.white,
                size: CommonUtils.getInstance(context).getWidth(35),)
            ),
          ),
        ],
      ),
    );
  }
}
