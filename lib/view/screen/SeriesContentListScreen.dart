import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/series_contents_list/SeriesContentsListFactoryController.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/SeriesEnableBottomViewCubit.dart';
import 'package:foxschool/bloc/series_contents_list/factory/cubit/SeriesItemListCubit.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SeriesEnableBottomViewState.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SeriesSelectItemCountState.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SeriesItemListState.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/SeriesTitleColorState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/view/widget/BottomIconTextView.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';

import '../../bloc/base/ContentsListBaseState.dart';
import '../../bloc/series_contents_list/factory/cubit/SeriesEnableInformationViewCubit.dart';
import '../../bloc/series_contents_list/factory/cubit/SeriesEnableDataViewCubit.dart';
import '../../bloc/series_contents_list/factory/cubit/SeriesLastWatchItemCubit.dart';
import '../../bloc/series_contents_list/factory/cubit/SeriesSelectItemCountCubit.dart';
import '../../bloc/series_contents_list/factory/cubit/SeriesTitleColorCubit.dart';
import '../../common/Common.dart';
import '../../data/main/series/base/SeriesBaseResult.dart';
import '../../di/Dependencies.dart';
import '../../values/AppColors.dart';
import '../widget/ContentsListItemView.dart';


class SeriesContentListScreen extends StatefulWidget {

  final SeriesBaseResult seriesBaseResult;

  const SeriesContentListScreen({
    super.key,
    required this.seriesBaseResult});

  @override
  State<SeriesContentListScreen> createState() => _SeriesContentListScreenState();
}

class _SeriesContentListScreenState extends State<SeriesContentListScreen> with TickerProviderStateMixin  {
  late ScrollController _scrollController;
  late SeriesContentsListFactoryController _factoryController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    Logger.d("initState");
    _scrollController = ScrollController();
    _factoryController = SeriesContentsListFactoryController(
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
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.color_edeef2,
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: <Widget>[
                    BlocBuilder<SeriesTitleColorCubit, SeriesTitleColorState>(builder: (context, state) {
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
                        onStretchTrigger: () async {
                          Logger.d("onStretchTrigger");
                        },
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white,),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    }),
                    BlocBuilder<SeriesItemListCubit, ContentsListBaseState>(builder: (context, state) {
                        if (state is SeriesItemListState)
                        {
                          _animationController.forward();
                          return SliverList(
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
                                  child: ContentsListItemView(
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
                                      Logger.d("Option pressed");
                                      _factoryController.onClickOption(index);
                                    },
                                  ),
                                ),
                              );
                            },
                              childCount: state.itemList.length,
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
              _buildBottomControllerLayout(),
              BlocBuilder<SeriesEnableBottomViewCubit, SeriesEnableBottomViewState>(builder: (context, state) {
                return Positioned(
                    right: CommonUtils.getInstance(context).getWidth(30),
                    bottom: CommonUtils.getInstance(context).getHeight(50),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: Common.DURATION_SHORT),
                      curve: Curves.decelerate,
                      transform: Matrix4.translationValues(state.isEnable ?
                      CommonUtils.getInstance(context).getWidth(200) : 0, 0, 0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          _factoryController.enableBottomSelectViewMode();
                        },
                        child: Image.asset('assets/image/btn_plus.png'),
                        shape: CircleBorder(),
                      ),
                    )
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControllerLayout()
  {
    return BlocBuilder<SeriesEnableBottomViewCubit, SeriesEnableBottomViewState>(builder: (context, state) {

      return Positioned(
        left: 0,
        bottom: 0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: Common.DURATION_NORMAL),
          curve: Curves.fastOutSlowIn,
          constraints: BoxConstraints(minHeight: 0), // 최소 높이 설정
          width: MediaQuery.of(context).size.width,
          height: state.isEnable ? CommonUtils.getInstance(context).getHeight(176) : 0,
          child: SingleChildScrollView(
            child: Container(
              color: AppColors.color_29c8e6,
              width: MediaQuery.of(context).size.width,
              height: CommonUtils.getInstance(context).getHeight(176),
              child: Row(
                children: [
                  BottomIconTextView(
                      image: Image.asset('assets/image/bottom_all.png',
                          width: CommonUtils.getInstance(context).getWidth(210),
                          height: CommonUtils.getInstance(context).getHeight(90),
                          fit: BoxFit.cover),
                      title: getIt<FoxschoolLocalization>().data['text_select_all'],
                      onPressed: (){
                        _factoryController.onSelectAll();
                      }) ,
                  Stack(
                    children: [
                      BottomIconTextView(
                          image: Image.asset('assets/image/bottom_play.png',
                              width: CommonUtils.getInstance(context).getWidth(210),
                              height: CommonUtils.getInstance(context).getHeight(90),
                              fit: BoxFit.cover),
                          title: getIt<FoxschoolLocalization>().data['text_select_play'],
                          onPressed: (){
                            _factoryController.onClickSelectedListPlay();
                          }),
                      BlocBuilder<SeriesSelectItemCountCubit, SeriesSelectItemCountState>(builder: (context, state) {

                        if(state.count != 0)
                          {
                            return Positioned(
                              right: state.count < 100 ? CommonUtils.getInstance(context).getWidth(100) : CommonUtils.getInstance(context).getWidth(85),
                              top: CommonUtils.getInstance(context).getHeight(20),
                              child: Container(
                                width: state.count < 100 ? CommonUtils.getInstance(context).getWidth(30) : CommonUtils.getInstance(context).getWidth(45),
                                height: CommonUtils.getInstance(context).getHeight(30),
                                decoration: BoxDecoration(
                                    color: AppColors.color_ffffff,
                                    borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(30))
                                ),
                                alignment: Alignment.center,
                                child: RobotoBoldText(
                                  text: '${state.count}',
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
                      },)
                    ],

                  ) ,
                  BottomIconTextView(
                      image: Image.asset('assets/image/bottom_bookshelf.png',
                          width: CommonUtils.getInstance(context).getWidth(210),
                          height: CommonUtils.getInstance(context).getHeight(90),
                          fit: BoxFit.cover),
                      title: getIt<FoxschoolLocalization>().data['text_contain_bookshelf'],
                      onPressed: (){

                      }) ,
                  BottomIconTextView(
                      image: Image.asset('assets/image/bottom_close.png',
                          width: CommonUtils.getInstance(context).getWidth(210),
                          height: CommonUtils.getInstance(context).getHeight(90),
                          fit: BoxFit.cover),
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
    });
  }

  @override
  void dispose() {
    _factoryController.dispose();
    super.dispose();
  }
}
