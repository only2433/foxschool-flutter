import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/category_contents_list/CategoryContentsListController.dart';
import 'package:foxschool/bloc/category_contents_list/factory/cubit/CategoryItemListCubit.dart';
import 'package:foxschool/bloc/category_contents_list/factory/cubit/CategoryTitleColorCubit.dart';
import 'package:foxschool/bloc/category_contents_list/factory/state/CategoryItemListState.dart';
import 'package:foxschool/bloc/category_contents_list/factory/state/CategoryTitleColorState.dart';
import 'package:foxschool/bloc/series_contents_list/SeriesContentsListFactoryController.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/ContentsItemListCubit.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/ContentsItemListState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';

import '../../bloc/base/ContentsListBaseState.dart';
import '../../common/Common.dart';
import '../../data/main/series/base/SeriesBaseResult.dart';
import '../../values/AppColors.dart';
import '../widget/ContentsListItemView.dart';
import '../widget/ThumbnailView.dart';


class StoryCategoryListScreen extends StatefulWidget {

  final SeriesBaseResult seriesBaseResult;

  const StoryCategoryListScreen({
    super.key,
    required this.seriesBaseResult});

  @override
  State<StoryCategoryListScreen> createState() => _StoryCategoryListScreenState();
}

class _StoryCategoryListScreenState extends State<StoryCategoryListScreen> with TickerProviderStateMixin  {
  late ScrollController _scrollController;
  late CategoryContentsListController _factoryController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _factoryController = CategoryContentsListController(
        context: context,
        currentSeriesBaseResult: widget.seriesBaseResult,
        scrollController: _scrollController);
    _factoryController.init();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: Common.DURATION_SHORT),
    );


  }

  @override
  Widget build(BuildContext context) {

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
                BlocBuilder<CategoryTitleColorCubit, CategoryTitleColorState>(builder: (context, state) {
                  return SliverAppBar(
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
                      icon: Icon(Icons.arrow_back, color: Colors.white,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                }),
                BlocBuilder<CategoryItemListCubit, ContentsListBaseState>(
                  builder: (context, state) {

                    if (state is CategoryItemListState) {
                      _animationController.forward();
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
                            return FadeTransition(
                              opacity: _animationController.drive(
                                Tween<double>(
                                  begin: 0.0,
                                  end: 1.0,
                                ).chain(
                                  CurveTween(
                                    curve: Interval(
                                      index * 0.1,
                                      1.0,
                                      curve: Curves.easeInOut,
                                    ),
                                  ),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _factoryController.onClickStorySeriesItem(state.itemList[index], context.widget);
                                },
                                child: ThumbnailView(
                                      id: state.itemList[index].id,
                                      imageUrl: state.itemList[index].thumbnailUrl,
                                      title: '${state.itemList[index].contentsCount} 편',
                                      level: state.itemList[index].level),
                              ),

                            );
                          },
                            childCount: state.itemList.length,
                          ),
                        ),
                      );
                    } else {
                      return SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(color: AppColors.color_47e1ad,),
                        ),
                      );
                    }
                  },
                ),
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
