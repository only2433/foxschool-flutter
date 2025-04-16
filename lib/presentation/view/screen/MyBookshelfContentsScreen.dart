
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/TopTitleButtonType.dart';
import 'package:foxschool/presentation/controller/bookshelf/MyBookshelfFactoryController.dart';
import 'package:foxschool/presentation/controller/bookshelf/river_pod/BookshelfListUINotifier.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/BottomIconTextView.dart';
import 'package:foxschool/presentation/view/widget/ContentsListItemView.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/view/widget/TopTitleView.dart';



class MyBookshelfContentsScreen extends ConsumerStatefulWidget {
  final String id;
  final String title;
  const MyBookshelfContentsScreen({
    super.key,
    required this.id,
    required this.title});

  @override
  MyBookshelfContentsViewState createState() => MyBookshelfContentsViewState();
}

class MyBookshelfContentsViewState extends ConsumerState<MyBookshelfContentsScreen> with TickerProviderStateMixin{
  late MyBookshelfFactoryController _factoryController;
  late AnimationController _animationController;
  @override
  void initState() {

    super.initState();

    _factoryController = MyBookshelfFactoryController(
        context: context,
        myBookshelfID: widget.id,
        widgetRef: ref);
    _factoryController.init();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: Common.DURATION_NORMAL),
    );
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(bookshelfListUINotifierProvider);

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
                      Consumer(builder: (context, ref, child) {

                        if(state.itemList.isNotEmpty)
                        {
                          _animationController.forward();

                          return ListView.builder(
                              itemCount: state.itemList.length + 1,
                              itemBuilder: (context, index) {
                                return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 2),
                                      end: Offset.zero
                                    ).animate(
                                        CurvedAnimation(
                                            parent: _animationController,
                                            curve: Interval(
                                              index * 0.1,
                                              1.0,
                                              curve: Curves.fastOutSlowIn
                                            ))
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
                                    ) : SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: CommonUtils.getInstance(context).getHeight(176),
                                        child: Center(
                                          child: Image.asset('assets/image/footer_logo132.png',
                                            width: CommonUtils.getInstance(context).getWidth(187),
                                            height: CommonUtils.getInstance(context).getHeight(97),
                                            fit: BoxFit.contain,),
                                        )
                                    ),
                                  ),
                                );
                              });
                        }
                        else
                        {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.color_47e1ad,
                            ),
                          );
                        }
                      },),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControllerLayout()
  {
    final state = ref.watch(bookshelfListUINotifierProvider);
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
                      if(state.itemList.isNotEmpty)
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
  }


  @override
  void dispose() {
    _factoryController.dispose();
    super.dispose();
  }

}

