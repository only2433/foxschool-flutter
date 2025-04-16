import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/presentation/controller/main/MainFactoryController.dart';
import 'package:foxschool/presentation/controller/main/river_pod/MainUINotifier.dart';
import 'package:foxschool/presentation/view/widget/ThumbnailView.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/values/AppColors.dart';

class MainSongSubScreen extends ConsumerWidget {

  final MainFactoryController factoryController;
  const MainSongSubScreen({
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
            height: CommonUtils.getInstance(context).getHeight(40),
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
                itemCount: state.songItemList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Logcats.message("select ID : ${state.songItemList[index].id}");
                      factoryController.onClickSongSeriesItem(state.songItemList[index], context.widget);
                    },
                    child: ThumbnailView(
                      id: state.songItemList[index].id,
                      imageUrl: state.songItemList[index].thumbnailUrl,
                      title: '${state.songItemList[index].contentsCount} 편',
                    ),
                  );
                },
              ),
          )
        ],
      ),
    );
  }
}
