
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/vocabulary/VocabularyFactoryController.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyBottomControllerCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyItemListCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyPlayingCubit.dart';

import 'package:foxschool/bloc/vocabulary/factory/cubit/VocabularyStudyTypeCubit.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/VocabularyItemListState.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/VocabularyPlayingState.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/VocabularyStudyTypeState.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/base/VocabularyBottomControllerState.dart';
import 'package:foxschool/bloc/vocabulary/factory/state/base/VocabularyListBaseState.dart';
import 'package:foxschool/data/vocabulary/information/VocabularyInformationData.dart';
import 'package:foxschool/enum/VocabularySelectType.dart';
import 'package:foxschool/view/widget/VocabularyItemWidget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../bloc/series_contents_list/factory/cubit/ContentsSelectItemCountCubit.dart';
import '../../bloc/series_contents_list/factory/state/ContentsSelectItemCountState.dart';
import '../../common/CommonUtils.dart';
import '../../common/FoxschoolLocalization.dart';
import '../../di/Dependencies.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../enum/VocabularyType.dart';
import '../../values/AppColors.dart';
import '../widget/BottomIconTextView.dart';
import '../widget/RobotoBoldText.dart';
import '../widget/RobotoNormalText.dart';
import '../widget/TopTitleView.dart';

class VocabularyScreen extends StatefulWidget {
  final VocabularyInformationData data;
  const VocabularyScreen({
    super.key,
    required this.data});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {

  final scrollDirection = Axis.vertical;
  late AutoScrollController _autoScrollController;
  late VocabularyFactoryController _factoryController;

  @override
  void initState() {
    super.initState();


    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(
        0,0,0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection
    );

    _factoryController = VocabularyFactoryController(
        context: context,
        vocabularyInformationData: widget.data,
        autoScrollController: _autoScrollController);
    _factoryController.init();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.color_1fb77c,
        child: SafeArea(
          child: Column(
            children: [
              TopTitleView(
                title: widget.data.title,
                type: TopTitleButtonType.BACK,
                onPressed: () {
                  _factoryController.onBackPressed();
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: CommonUtils.getInstance(context).getHeight(144),
                color: AppColors.color_ffffff,
                child: _buildSelectItemLayout(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: CommonUtils.getInstance(context).getHeight(20),
                color: AppColors.color_edeef2,
              ),
              Expanded(
                  child: Container(
                    color: AppColors.color_edeef2,
                    child: BlocBuilder<VocabularyItemListCubit, VocabularyListBaseState>(builder: (context, listState) {

                      if(listState is VocabularyItemListState)
                        {
                            Logger.d("stateA : ${listState.data.length}");
                            return BlocBuilder<VocabularyStudyTypeCubit, VocabularyStudyTypeState>(
                              builder: (context, studyTypeState) {
                                Logger.d("----- listState : ${listState.data.length}");
                                return ListView.builder(
                                  scrollDirection: scrollDirection,
                                  controller: _autoScrollController,
                                  itemCount: listState.data.length,
                                  itemBuilder: (context, index) {

                                    Logger.d("isSelected : ${listState.data[index].isSelected}");
                                    return AutoScrollTag(
                                        key: ValueKey(index),
                                        controller: _autoScrollController,
                                        index: index,
                                        child: VocabularyItemWidget(
                                          title: listState.data[index].wordText,
                                          mean: listState.data[index].meanText,
                                          example: listState.data[index].exampleText,
                                          isSelected: listState.data[index].isSelected,
                                          isCurrentPlaying: listState.data[index].isPlaying,
                                          isEnableTitle: studyTypeState.isSelectTitle,
                                          isEnableMean: studyTypeState.isSelectMean,
                                          isEnableExample: studyTypeState.isSelectExample,
                                          lineCount: listState.data[index].lineCount,
                                          onItemPressed: () {
                                            Logger.d("item pressed : $index");
                                            _factoryController.onSelectItem(index);
                                          },
                                          onPlayIconPressed: () {
                                            Logger.d("play pressed : $index");
                                            _factoryController.onPlayItem(index);
                                          },
                                        )
                                    );
                                  },);
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

                    }),
              )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: CommonUtils.getInstance(context).getHeight(176),
                color: AppColors.color_29b8c6,
                child: widget.data.type == VocabularyType.VOCABULARY_CONTENTS ? _buildBottomContentsLayout() : _buildBottomBookshelfLayout(),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectItemLayout()
  {
    return BlocBuilder<VocabularyStudyTypeCubit, VocabularyStudyTypeState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              _factoryController.onClickSelectType(VocabularySelectType.ALL);
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(150),
              height: CommonUtils.getInstance(context).getHeight(120),
              child: Row(
                children: [
                  Image.asset( state.isSelectAll ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
                    width: CommonUtils.getInstance(context).getWidth(60),
                    height: CommonUtils.getInstance(context).getHeight(60),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(15),
                  ),
                  RobotoNormalText(
                    text: getIt<FoxschoolLocalization>().data['text_all'],
                    fontSize: CommonUtils.getInstance(context).getWidth(38),
                    color: AppColors.color_444444,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _factoryController.onClickSelectType(VocabularySelectType.WORD);
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(150),
              height: CommonUtils.getInstance(context).getHeight(120),
              child: Row(
                children: [
                  Image.asset(state.isSelectTitle ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
                    width: CommonUtils.getInstance(context).getWidth(60),
                    height: CommonUtils.getInstance(context).getHeight(60),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(15),
                  ),
                  RobotoNormalText(
                    text: getIt<FoxschoolLocalization>().data['text_words'],
                    fontSize: CommonUtils.getInstance(context).getWidth(38),
                    color: AppColors.color_444444,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _factoryController.onClickSelectType(VocabularySelectType.MEAN);
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(150),
              height: CommonUtils.getInstance(context).getHeight(120),
              child: Row(
                children: [
                  Image.asset( state.isSelectMean ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
                    width: CommonUtils.getInstance(context).getWidth(60),
                    height: CommonUtils.getInstance(context).getHeight(60),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(15),
                  ),
                  RobotoNormalText(
                    text: getIt<FoxschoolLocalization>().data['text_meaning'],
                    fontSize: CommonUtils.getInstance(context).getWidth(38),
                    color: AppColors.color_444444,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _factoryController.onClickSelectType(VocabularySelectType.EXAMPLE);
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(150),
              height: CommonUtils.getInstance(context).getHeight(120),
              child: Row(
                children: [
                  Image.asset( state.isSelectExample ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
                    width: CommonUtils.getInstance(context).getWidth(60),
                    height: CommonUtils.getInstance(context).getHeight(60),
                  ),
                  SizedBox(
                    width: CommonUtils.getInstance(context).getWidth(15),
                  ),
                  RobotoNormalText(
                    text: getIt<FoxschoolLocalization>().data['text_example'],
                    fontSize: CommonUtils.getInstance(context).getWidth(38),
                    color: AppColors.color_444444,)
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  Widget _buildBottomContentsLayout() {

    return BlocBuilder<VocabularyPlayingCubit, VocabularyPlayingState>(builder: (context, playingState) {
      return Container(
        color: AppColors.color_29c8e6,
        width: MediaQuery.of(context).size.width,
        height: CommonUtils.getInstance(context).getHeight(176),
        child: Row(
          children: [
            BlocBuilder<VocabularyBottomControllerCubit, VocabularyBottomControllerState>(
                buildWhen: (previous, current) => current is VocabularySelectIntervalState,
                builder: (context, state) {
                  return BottomIconTextView(
                      imageAssetUri: 'assets/image/bottom_interval.png',
                      title: state is VocabularySelectIntervalState ? getIt<FoxschoolLocalization>().data['text_list_vocabulary_interval'][state.index] : "",
                      isPlaying: playingState.isPlaying,
                      onPressed: playingState.isPlaying == false ? () {
                        _factoryController.onClickInterval();
                      } : null,
                  );
                }),
            BlocBuilder<VocabularyBottomControllerCubit, VocabularyBottomControllerState>(
                buildWhen: (previous, current) => current is VocabularySelectAllState,
                builder:(context, state)
                {
                  bool isSelected = state is VocabularySelectAllState && state.isHaveSelectedItem;
                  return BottomIconTextView(
                      imageAssetUri: isSelected ? 'assets/image/bottom_close.png' :  'assets/image/bottom_all.png',
                      title: isSelected ? getIt<FoxschoolLocalization>().data['text_select_init'] :  getIt<FoxschoolLocalization>().data['text_select_all'],
                      isPlaying: playingState.isPlaying,
                      onPressed: playingState.isPlaying == false ? () async {
                        _factoryController.onClickSelectAll();
                      } : null,
                  );
                }),
            Stack(
              children: [
                BottomIconTextView(
                    imageAssetUri: playingState.isPlaying ? 'assets/image/bottom_stop.png' : 'assets/image/bottom_play.png',
                    title: playingState.isPlaying ? getIt<FoxschoolLocalization>().data['text_stop_play'] : getIt<FoxschoolLocalization>().data['text_select_play'],
                    onPressed: () {
                      _factoryController.onClickSelectPlay();
                    }),
                BlocBuilder<VocabularyBottomControllerCubit, VocabularyBottomControllerState>(
                  buildWhen: (previous, current) => current is VocabularySelectItemCountState,
                  builder: (context, state)
                  {
                    bool isSelectCountState = state is VocabularySelectItemCountState;
                    if (isSelectCountState && state.count != 0) {
                      return Positioned(
                        right: state.count < 100 ? CommonUtils.getInstance(context).getWidth(100) : CommonUtils.getInstance(context).getWidth(85),
                        top: CommonUtils.getInstance(context).getHeight(20),
                        child: Container(
                          width: state.count < 100 ? CommonUtils.getInstance(context).getWidth(35) : CommonUtils.getInstance(context).getWidth(45),
                          height: CommonUtils.getInstance(context).getHeight(30),
                          decoration: BoxDecoration(color: AppColors.color_ffffff, borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(30))),
                          alignment: Alignment.center,
                          child: RobotoBoldText(
                            text: '${state.count}',
                            fontSize: CommonUtils.getInstance(context).getWidth(20),
                            color: AppColors.color_29c8e6,
                            align: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),

            BottomIconTextView(
                imageAssetUri: 'assets/image/bottom_voca.png',
                title: getIt<FoxschoolLocalization>().data['text_add_vocabulary'],
                isPlaying: playingState.isPlaying,
                onPressed: (){
                  _factoryController.onClickAddVocabulary();
                }) ,

          ],
        ),
      );
    });
  }

  Widget _buildBottomBookshelfLayout()
  {
    return BlocBuilder<VocabularyPlayingCubit, VocabularyPlayingState>(builder: (context, playingState) {
      return Container(
        color: AppColors.color_29c8e6,
        width: MediaQuery.of(context).size.width,
        height: CommonUtils.getInstance(context).getHeight(176),
        child: Row(
          children: [
            BlocBuilder<VocabularyBottomControllerCubit, VocabularyBottomControllerState>(builder: (context, state) {
              return BottomIconTextView(
                width: CommonUtils.getInstance(context).getWidth(210),
                imageAssetUri: 'assets/image/bottom_interval.png',
                title: state is VocabularySelectIntervalState ? getIt<FoxschoolLocalization>().data['text_list_vocabulary_interval'][state.index] : "",
                isPlaying: playingState.isPlaying,
                onPressed: playingState.isPlaying == false ? () {
                  _factoryController.onClickInterval();
                } : null,
              );
            }) ,
            BlocBuilder<VocabularyBottomControllerCubit, VocabularyBottomControllerState>(
                buildWhen: (previous, current) => current is VocabularySelectAllState,
                builder:(context, state)
                {
                  bool isSelected = state is VocabularySelectAllState && state.isHaveSelectedItem;
                  return BottomIconTextView(
                    width: CommonUtils.getInstance(context).getWidth(210),
                    imageAssetUri: isSelected ? 'assets/image/bottom_close.png' :  'assets/image/bottom_all.png',
                    title: isSelected ? getIt<FoxschoolLocalization>().data['text_select_init'] :  getIt<FoxschoolLocalization>().data['text_select_all'],
                    isPlaying: playingState.isPlaying,
                    onPressed: playingState.isPlaying == false ? () async {
                      _factoryController.onClickSelectAll();
                    } : null,
                  );
                }),
            Stack(
              children: [
                BottomIconTextView(
                    width: CommonUtils.getInstance(context).getWidth(210),
                    imageAssetUri: playingState.isPlaying ? 'assets/image/bottom_stop.png' : 'assets/image/bottom_play.png',
                    title: playingState.isPlaying ? getIt<FoxschoolLocalization>().data['text_stop_play'] : getIt<FoxschoolLocalization>().data['text_select_play'],
                    onPressed: () {
                      _factoryController.onClickSelectPlay();
                    }),
                BlocBuilder<VocabularyBottomControllerCubit, VocabularyBottomControllerState>(
                  buildWhen: (previous, current) => current is VocabularySelectItemCountState,
                  builder: (context, state)
                  {
                    bool isSelectCountState = state is VocabularySelectItemCountState;
                    if (isSelectCountState && state.count != 0) {
                      return Positioned(
                        right: state.count < 100 ? CommonUtils.getInstance(context).getWidth(100) : CommonUtils.getInstance(context).getWidth(85),
                        top: CommonUtils.getInstance(context).getHeight(20),
                        child: Container(
                          width: state.count < 100 ? CommonUtils.getInstance(context).getWidth(35) : CommonUtils.getInstance(context).getWidth(45),
                          height: CommonUtils.getInstance(context).getHeight(30),
                          decoration: BoxDecoration(color: AppColors.color_ffffff, borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(30))),
                          alignment: Alignment.center,
                          child: RobotoBoldText(
                            text: '${state.count}',
                            fontSize: CommonUtils.getInstance(context).getWidth(20),
                            color: AppColors.color_29c8e6,
                            align: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
            BottomIconTextView(
                width: CommonUtils.getInstance(context).getWidth(210),
                imageAssetUri: 'assets/image/bottom_flashcard.png',
                title: getIt<FoxschoolLocalization>().data['text_flashcards'],
                isPlaying: playingState.isPlaying,
                onPressed: playingState.isPlaying == false ? () async {

                  } : null,
                ) ,
            BottomIconTextView(
                width: CommonUtils.getInstance(context).getWidth(210),
                imageAssetUri: 'assets/image/bottom_delete.png',
                title: getIt<FoxschoolLocalization>().data['text_delete'],
                isPlaying: playingState.isPlaying,
                onPressed: playingState.isPlaying == false ? () async {
                  _factoryController.onClickDeleteVocabularyItem();
                  } : null,
                ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _factoryController.dispose();
    _autoScrollController.dispose();

    super.dispose();
  }
}
