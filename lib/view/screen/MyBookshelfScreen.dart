
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxschool/bloc/bookshelf/MyBookshelfFactoryController.dart';
import 'package:foxschool/bloc/series_contents_list/factory/state/ContentsItemListState.dart';

import '../../bloc/base/ContentsListBaseState.dart';
import '../../bloc/bookshelf/api/MyBookshelfBloc.dart';
import '../../bloc/series_contents_list/factory/cubit/ContentsEnableBottomViewCubit.dart';
import '../../bloc/series_contents_list/factory/cubit/ContentsItemListCubit.dart';
import '../../bloc/series_contents_list/factory/cubit/ContentsSelectItemCountCubit.dart';
import '../../bloc/series_contents_list/factory/state/ContentsEnableBottomViewState.dart';
import '../../bloc/series_contents_list/factory/state/ContentsSelectItemCountState.dart';
import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../di/Dependencies.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../values/AppColors.dart';
import '../widget/BottomIconTextView.dart';
import '../widget/ContentsListItemView.dart';
import '../widget/RobotoBoldText.dart';
import '../widget/TopTitleView.dart';

class MyBookshelfScreen extends StatelessWidget {
  final String id;
  final String title;
  const MyBookshelfScreen({
    super.key,
    required this.id,
    required this.title});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ContentsEnableBottomViewCubit()),
          BlocProvider(create: (context) => ContentsItemListCubit()),
          BlocProvider(create: (context) => ContentsSelectItemCountCubit()),
        ],
        child: MyBookshelfContentsView(
          id: id,
          title: title,
        ));
  }
}

class MyBookshelfContentsView extends StatefulWidget {
  final String id;
  final String title;
  const MyBookshelfContentsView({
    super.key,
    required this.id,
    required this.title});

  @override
  State<MyBookshelfContentsView> createState() => _MyBookshelfContentsViewState();
}

class _MyBookshelfContentsViewState extends State<MyBookshelfContentsView> with TickerProviderStateMixin{
  late MyBookshelfFactoryController _factoryController;

  @override
  void initState() {

    super.initState();

    _factoryController = MyBookshelfFactoryController(
        context: context,
        myBookshelfID: widget.id);
    _factoryController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_edeef2,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.color_1fb77c,
        child: SafeArea(
          child: Column(
            children: [
              TopTitleView(
                title: widget.title,
                type: TopTitleButtonType.BACK,
                onPressed: () {
                  _factoryController.onBackPressed();
                },
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: AppColors.color_ffffff,
                  child: Stack(
                    children: [
                      BlocBuilder<ContentsItemListCubit, ContentsListBaseState>(builder: (context, state) {
                        if(state is ContentsItemListState)
                          {
                            return ListView.builder(
                              itemCount: state.itemList.length + 1,
                              itemBuilder: (context, index) {
                                return Padding(
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
                                    title: state.itemList[index].getContentsName(),
                                    isSelected: state.itemList[index].isSelected,
                                    onItemPressed: () {
                                      _factoryController.onSelectItem(index);
                                    },
                                    onThumbnailPressed: () {
                                      _factoryController.onClickThumbnailItem(index);
                                    },
                                    onOptionPressed: () {
                                      _factoryController.onClickOption(index);
                                    },
                                  ) : Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: CommonUtils.getInstance(context).getHeight(176),
                                    child: Center(
                                      child: Image.asset('assets/image/footer_logo132.png',
                                        width: CommonUtils.getInstance(context).getWidth(187),
                                        height: CommonUtils.getInstance(context).getHeight(97),
                                        fit: BoxFit.contain,),
                                    )
                                  ),
                                );
                              });
                          }
                        else
                          {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.color_47e1ad,
                              ),
                            );
                          }
                      },),
                      _buildBottomControllerLayout(),
                      BlocBuilder<ContentsEnableBottomViewCubit, ContentsEnableBottomViewState>(builder: (context, state) {
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControllerLayout()
  {
    return BlocBuilder<ContentsEnableBottomViewCubit, ContentsEnableBottomViewState>(builder: (context, state) {

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
                      BlocBuilder<ContentsSelectItemCountCubit, ContentsSelectItemCountState>(builder: (context, state) {

                        if(state.count != 0)
                        {
                          return Positioned(
                            right: state.count < 100 ? CommonUtils.getInstance(context).getWidth(100) : CommonUtils.getInstance(context).getWidth(85),
                            top: CommonUtils.getInstance(context).getHeight(20),
                            child: Container(
                              width: state.count < 100 ? CommonUtils.getInstance(context).getWidth(35) : CommonUtils.getInstance(context).getWidth(45),
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
                      imageAssetUri: 'assets/image/bottom_delete.png',
                      title: getIt<FoxschoolLocalization>().data['text_delete'],
                      onPressed: (){
                        _factoryController.onClickDeleteMyBookshelfItem();
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
    });
  }


  @override
  void dispose() {
    _factoryController.dispose();
    super.dispose();
  }

}

