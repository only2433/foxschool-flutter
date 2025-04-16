

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/presentation/controller/series_contents_list/SeriesContentsListFactoryController.dart';
import 'package:foxschool/presentation/controller/series_contents_list/river_pod/SeriesListUINotifier.dart';
import 'package:foxschool/presentation/view/widget/BottomIconTextView.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/data/model/main/series/base/SeriesBaseResult.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/ContentsListItemView.dart';

class SeriesContentListScreen extends ConsumerStatefulWidget {

  final SeriesBaseResult seriesBaseResult;

  const SeriesContentListScreen({
    super.key,
    required this.seriesBaseResult});

  @override
  SeriesContentListScreenState createState() => SeriesContentListScreenState();
}

class SeriesContentListScreenState extends ConsumerState<SeriesContentListScreen> with TickerProviderStateMixin  {
  late ScrollController _scrollController;
  late SeriesContentsListFactoryController _factoryController;
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();

    Logcats.message("initState");

    _scrollController = ScrollController();
    // Delay the state reset to avoid modifying the provider during the build phase
    Future.delayed(Duration.zero, () {
      ref.invalidate(seriesListUINotifierProvider);
    });

    _factoryController = SeriesContentsListFactoryController(
        context: context,
        currentSeriesBaseResult: widget.seriesBaseResult,
        scrollController: _scrollController,
        widgetRef: ref);
    _factoryController.init();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: Common.DURATION_NORMAL),
    );

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();


  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(seriesListUINotifierProvider);

    Color statusBarColor = CommonUtils.getInstance(context).colorFromHex(widget.seriesBaseResult.colors!.statusBar);
    Color topBarColor = CommonUtils.getInstance(context).colorFromHex(widget.seriesBaseResult.colors!.title);


    return Scaffold(
      backgroundColor: AppColors.color_edeef2,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: statusBarColor,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.color_edeef2,
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
                      onStretchTrigger: () async {
                        Logcats.message("onStretchTrigger");
                      },
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Consumer(builder: (context, ref, child) {

                      if (state.itemList.isNotEmpty)
                      {
                        _animationController.forward();
                        return SliverList(
                          delegate: SliverChildBuilderDelegate((context, index) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 2),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Interval(
                                    index * 0.1,
                                    1.0,
                                    curve: Curves.fastOutSlowIn
                                  )
                              )),
                              child: Padding(
                                padding: index == 0 ?
                                EdgeInsets.only(
                                    top: CommonUtils.getInstance(context).getHeight(40),
                                    bottom: CommonUtils.getInstance(context).getHeight(20),
                                    left: CommonUtils.getInstance(context).getWidth(25),
                                    right: CommonUtils.getInstance(context).getWidth(25)
                                )
                                    : EdgeInsets.only(
                                    bottom: CommonUtils.getInstance(context).getHeight(20),
                                    left: CommonUtils.getInstance(context).getWidth(25),
                                    right: CommonUtils.getInstance(context).getWidth(25)
                                ),
                                child: index < state.itemList.length ? ContentsListItemView(
                                  thumbnailUrl: state.itemList[index].thumbnailUrl,
                                  index: state.itemList[index].index,
                                  indexColor: state.seriesColor,
                                  isSelected: state.itemList[index].isSelected,
                                  title: state.itemList[index].getSubName(),
                                  onItemPressed: () {
                                    _factoryController.onSelectedItem(index);
                                  },
                                  onThumbnailPressed: () {
                                    _factoryController.onClickThumbnailItem(index);
                                  },
                                  onOptionPressed: (){
                                    Logcats.message("Option pressed");
                                    _factoryController.onClickOption(index);
                                  },
                                ) : SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: CommonUtils.getInstance(context).getHeight(176),
                                  child: Center(
                                    child: Image.asset('assets/image/footer_logo132.png',
                                      width: CommonUtils.getInstance(context).getWidth(187),
                                      height: CommonUtils.getInstance(context).getHeight(97),
                                      fit: BoxFit.contain,),
                                  ),
                                ),
                              ),
                            );
                          },
                            childCount: state.itemList.length + 1,
                          ),
                        );
                      } else {
                        return const SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(color: AppColors.color_47e1ad),
                          ),
                        );
                      }
                    },),
                  ],
                ),
              ),
              _buildBottomControllerLayout(),
              Positioned(
                  right: CommonUtils.getInstance(context).getWidth(30),
                  bottom: CommonUtils.getInstance(context).getHeight(50),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: Common.DURATION_SHORT),
                    curve: Curves.decelerate,
                    transform: Matrix4.translationValues(state.isEnableBottomSelectView ?
                    CommonUtils.getInstance(context).getWidth(200) : 0, 0, 0),
                    child: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        _factoryController.enableBottomSelectViewMode();
                      },
                      shape: const CircleBorder(),
                      child: Image.asset('assets/image/btn_plus.png'),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControllerLayout()
  {
    final state = ref.watch(seriesListUINotifierProvider);
    return Positioned(
      left: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: Common.DURATION_NORMAL),
        curve: Curves.fastOutSlowIn,
        constraints: const BoxConstraints(minHeight: 0), // 최소 높이 설정
        width: MediaQuery.of(context).size.width,
        height: state.isEnableBottomSelectView ? CommonUtils.getInstance(context).getHeight(176) : 0,
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.color_29c8e6,
            width: MediaQuery.of(context).size.width,
            height: CommonUtils.getInstance(context).getHeight(176),
            child: Row(
              children: [
                BottomIconTextView(
                    imageAssetUri: 'assets/image/bottom_all.png',
                    title: getIt<FoxschoolLocalization>().data['text_select_all'],
                    onPressed: (){
                      _factoryController.onSelectAll();
                    }) ,
                Stack(
                  children: [
                    BottomIconTextView(
                        imageAssetUri: 'assets/image/bottom_play.png',
                        title: getIt<FoxschoolLocalization>().data['text_select_play'],
                        onPressed: (){
                          _factoryController.onClickSelectedListPlay();
                        }),
                    Consumer(builder: (context, ref, child) {
                      if(state.selectItemCount != 0)
                      {
                        return Positioned(
                          right: state.selectItemCount < 100 ? CommonUtils.getInstance(context).getWidth(100) : CommonUtils.getInstance(context).getWidth(85),
                          top: CommonUtils.getInstance(context).getHeight(20),
                          child: Container(
                            width: state.selectItemCount < 100 ? CommonUtils.getInstance(context).getWidth(35) : CommonUtils.getInstance(context).getWidth(45),
                            height: CommonUtils.getInstance(context).getHeight(30),
                            decoration: BoxDecoration(
                                color: AppColors.color_ffffff,
                                borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(30))
                            ),
                            alignment: Alignment.center,
                            child: RobotoBoldText(
                              text: '${state.selectItemCount}',
                              fontSize: CommonUtils.getInstance(context).getWidth(20),
                              color: AppColors.color_29c8e6,
                              align: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      else
                      {
                        return Container();
                      }
                    })
                  ],

                ) ,
                BottomIconTextView(
                    imageAssetUri: 'assets/image/bottom_bookshelf.png',
                    title: getIt<FoxschoolLocalization>().data['text_contain_bookshelf'],
                    onPressed: (){
                      _factoryController.onClickAddMyBookshelf();
                    }) ,
                BottomIconTextView(
                    imageAssetUri: 'assets/image/bottom_close.png',
                    title: getIt<FoxschoolLocalization>().data['text_cancel'],
                    onPressed: (){
                      _factoryController.disableBottomSelectViewMode();
                    }) ,
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
