import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/presentation/controller/category_list/CategoryListController.dart';
import 'package:foxschool/presentation/controller/category_list/river_pod/CategoryListUINotifier.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/bloc/base/ContentsListBaseState.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/main/series/base/SeriesBaseResult.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/ThumbnailView.dart';


class StoryCategoryListScreen extends ConsumerStatefulWidget {

  final SeriesBaseResult seriesBaseResult;

  const StoryCategoryListScreen({
    super.key,
    required this.seriesBaseResult});

  @override
  StoryCategoryListScreenState createState() => StoryCategoryListScreenState();
}

class StoryCategoryListScreenState extends ConsumerState<StoryCategoryListScreen> with TickerProviderStateMixin  {
  late ScrollController _scrollController;
  late CategoryListController _factoryController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _factoryController = CategoryListController(
        context: context,
        currentSeriesBaseResult: widget.seriesBaseResult,
        scrollController: _scrollController,
        widgetRef: ref);
    _factoryController.init();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: Common.DURATION_SHORT),
    );


  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryListUINotifierProvider);

    Color statusBarColor = CommonUtils.getInstance(context).colorFromHex(widget.seriesBaseResult.colors!.statusBar);
    Color topBarColor = CommonUtils.getInstance(context).colorFromHex(widget.seriesBaseResult.colors!.title);
    return Scaffold(
      backgroundColor: AppColors.color_edeef2,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: statusBarColor,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.color_f5f5f5,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: topBarColor,
                  toolbarHeight: CommonUtils.getInstance(context).getHeight(150),
                  expandedHeight: CommonUtils.getInstance(context).getHeight(607),
                  centerTitle: true,
                  title: RobotoBoldText(
                    text: widget.seriesBaseResult.name,
                    fontSize: CommonUtils.getInstance(context).getWidth(50),
                    color: state.titleColor,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,

                    background: Hero(
                      tag: widget.seriesBaseResult.id,
                      child: Image.network(
                        widget.seriesBaseResult.thumbnailUrl,
                        height: CommonUtils.getInstance(context).getHeight(607),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  if (state.isContentsLoading == false) {

                    return SliverPadding(
                      padding: EdgeInsets.only(
                          top: CommonUtils.getInstance(context).getHeight(40)
                      ),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: CommonUtils.getInstance(context).getHeight(10),
                            mainAxisExtent: CommonUtils.getInstance(context).getHeight(374)),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          _animationController.forward();
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 2),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: _animationController,
                                curve: Interval(
                                  index * 0.1,
                                  1.0,
                                  curve: Curves.fastOutSlowIn,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _factoryController.onClickStorySeriesItem(state.contentsList[index], context.widget);
                              },
                              child: ThumbnailView(
                                  id: state.contentsList[index].id,
                                  imageUrl: state.contentsList[index].thumbnailUrl,
                                  title: '${state.contentsList[index].contentsCount} 편',
                                  level: state.contentsList[index].level),
                            ),

                          );
                        },
                          childCount: state.contentsList.length,
                        ),
                      ),
                    );
                  } else {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(color: AppColors.color_47e1ad,),
                      ),
                    );
                  }
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _factoryController.dispose();
    super.dispose();
  }
}
