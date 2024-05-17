import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/main/MainFactoryController.dart';
import 'package:foxschool/bloc/main/factory/cubit/MainStorySelectTypeListCubit.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/data/main/MainInformationResult.dart';
import 'package:foxschool/enum/UserType.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';
import 'package:foxschool/view/widget/ToggleTextButton.dart';
import 'package:foxschool/common/Preference.dart' as Preference;
import 'package:foxschool/view/widget/ThumbnailView.dart';
import '../../../../bloc/main/factory/state/MainStorySelectTypeListState.dart';
import '../../../../common/Common.dart';
import '../../../../common/FoxschoolLocalization.dart';
import '../../../../data/main/series/SeriesInformationResult.dart';
import '../../../../di/Dependencies.dart';
import '../../../../enum/SeriesType.dart';
import '../../../../values/AppColors.dart';
import '../../SeriesContentListScreen.dart';

class MainStorySubScreen extends StatelessWidget {

  final MainFactoryController factoryController;

  const MainStorySubScreen({
    super.key,
    required this.factoryController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.color_f5f5f5,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: CommonUtils.getInstance(context).getHeight(40),
                ),
                ToggleTextButton(
                  width: CommonUtils.getInstance(context).getWidth(660),
                  height: CommonUtils.getInstance(context).getHeight(96),
                  firstButtonText: getIt<FoxschoolLocalization>().data['text_levels'],
                  secondButtonText: getIt<FoxschoolLocalization>().data['text_categories'],
                  type: UserType.STUDENT,
                  onSelected: (index) {
                    if(index == 0)
                    {
                      factoryController.onClickStorySelectType(SeriesType.LEVEL);
                    }
                    else
                    {
                      factoryController.onClickStorySelectType(SeriesType.CATEGORY);
                    }
                  },
                ),
                SizedBox(
                  height: CommonUtils.getInstance(context).getHeight(40),
                ),
              ],
            ),
          ),

          Expanded(
              child: Container(

                child: BlocBuilder<MainStorySelectTypeListCubit, MainStorySelectTypeListState>(builder: (context, state) {
                  return GridView.builder(

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: CommonUtils.getInstance(context).getHeight(10),
                      crossAxisSpacing: CommonUtils.getInstance(context).getHeight(10),
                      mainAxisExtent: CommonUtils.getInstance(context).getHeight(374),
                    ),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(20)),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Logger.d("select ID : " + state.list[index].id);
                          factoryController.onClickStorySeriesItem(state.list[index], context.widget);
                        },
                        child: ThumbnailView(
                            id: state.list[index].id,
                            imageUrl: state.list[index].thumbnailUrl,
                            title: '${state.list[index].contentsCount} 편',
                            level: state.list[index].level),
                      );
                    },
                  );
                },),
              )
          )
        ],
      ),
    );
  }
}
