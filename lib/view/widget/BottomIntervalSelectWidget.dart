
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:foxschool/view/widget/RobotoRegularText.dart';

import '../../di/Dependencies.dart';
import '../../values/AppColors.dart';

class BottomIntervalSelectWidget extends StatelessWidget {
  final int currentSelectIndex;
  final Function(int index) onItemPressed;
  const BottomIntervalSelectWidget({
    super.key,
    required this.currentSelectIndex,
    required this.onItemPressed});

  @override
  Widget build(BuildContext context) {

    List<dynamic> textList = getIt<FoxschoolLocalization>().data['text_list_vocabulary_interval'];

    for(int i = 0; i < textList.length; i++)
      {
        Logger.d("index : $i , text : ${textList[i]}");
      }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(450),
      color: AppColors.color_ffffff,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getWidth(142),
            child: Row(
              children: [
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(40),
                ),
                RobotoNormalText(
                  text: getIt<FoxschoolLocalization>().data['text_select_continuous_listening'],
                  fontSize: CommonUtils.getInstance(context).getWidth(48),
                  color: AppColors.color_000000,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(2),
            color: AppColors.color_b9b9b9,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(308),
            padding: EdgeInsets.only(
              top: CommonUtils.getInstance(context).getHeight(48),
              left: CommonUtils.getInstance(context).getWidth(30),
              right: CommonUtils.getInstance(context).getWidth(30)
            ),
            child: GridView.count(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                childAspectRatio: 180/100,
                children: List.generate(10, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      onItemPressed(index);
                    },
                    child: _buildSelectItem(
                        context: context,
                        title: textList[index],
                        isSelected: currentSelectIndex == index ? true : false
                    ),
                  );
                }),),
          )
        ],
      ),
    );
  }

  Widget _buildSelectItem({required BuildContext context, required String title, required bool isSelected})
  {
    return Container(
      width: CommonUtils.getInstance(context).getWidth(180),
      height: CommonUtils.getInstance(context).getHeight(100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.color_1fb77c : AppColors.color_d9dede,
        borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(90))
      ),
      child: RobotoNormalText(
        text: title,
        color: isSelected ? AppColors.color_ffffff : AppColors.color_b9b9b9,
        fontSize: CommonUtils.getInstance(context).getWidth(34),
      ),

    );
  }

}
