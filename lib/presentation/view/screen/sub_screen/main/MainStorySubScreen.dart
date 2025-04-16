import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/presentation/controller/main/MainFactoryController.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/view/widget/ToggleTextButton.dart';
import 'package:foxschool/presentation/view/widget/ThumbnailView.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/StorySeriesType.dart';
import 'package:foxschool/values/AppColors.dart';

class MainStorySubScreen extends ConsumerWidget {

  final MainFactoryController factoryController;

  const MainStorySubScreen({
    super.key,
    required this.factoryController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(mainUINotifierProvider);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.color_f5f5f5,
      child: Column(
        children: [
          SizedBox(
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
                  selectIndex: state.storySeriesType == StorySeriesType.LEVEL ? 0 : 1,
                  onSelected: (index) {
                    if(index == 0)
                    {
                      factoryController.onClickStorySelectType(StorySeriesType.LEVEL);
                    }
                    else
                    {
                      factoryController.onClickStorySelectType(StorySeriesType.CATEGORY);
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: CommonUtils.getInstance(context).getHeight(10),
                  crossAxisSpacing: CommonUtils.getInstance(context).getHeight(10),
                  mainAxisExtent: CommonUtils.getInstance(context).getHeight(374),
                ),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: CommonUtils.getInstance(context).getWidth(20)),
                itemCount: state.storyItemList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Logcats.message("select ID : ${state.storyItemList[index].id}");
                      factoryController.onClickStorySeriesItem(state.storyItemList[index], context.widget);
                    },
                    child: ThumbnailView(
                        id: state.storyItemList[index].id,
                        imageUrl: state.storyItemList[index].thumbnailUrl,
                        title: '${state.storyItemList[index].contentsCount} 편',
                        level: state.storyItemList[index].level),
                  );
                },
              )
          )
        ],
      ),
    );
  }
}
