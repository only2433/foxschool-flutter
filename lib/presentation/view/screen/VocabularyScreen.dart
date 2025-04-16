
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/data/model/vocabulary/information/VocabularyInformationData.dart';
import 'package:foxschool/enum/VocabularySelectType.dart';
import 'package:foxschool/presentation/controller/vocabulary/VocabularyFactoryController.dart';
import 'package:foxschool/presentation/controller/vocabulary/river_pod/VocabularyUINotifier.dart';
import 'package:foxschool/presentation/view/widget/VocabularyItemWidget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/enum/TopTitleButtonType.dart';
import 'package:foxschool/enum/VocabularyType.dart';
import 'package:foxschool/values/AppColors.dart';
import 'package:foxschool/presentation/view/widget/BottomIconTextView.dart';
import 'package:foxschool/presentation/view/widget/RobotoBoldText.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/presentation/view/widget/TopTitleView.dart';

class VocabularyScreen extends ConsumerStatefulWidget {
  final VocabularyInformationData data;
  const VocabularyScreen({
    super.key,
    required this.data});

  @override
  VocabularyScreenState createState() => VocabularyScreenState();
}

class VocabularyScreenState extends ConsumerState<VocabularyScreen> {

  final scrollDirection = Axis.vertical;
  late AutoScrollController _autoScrollController;
  late VocabularyFactoryController _factoryController;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ref.invalidate(vocabularyUINotifierProvider);
    });

    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(
        0,0,0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection
    );

    _factoryController = VocabularyFactoryController(
        context: context,
        vocabularyInformationData: widget.data,
        autoScrollController: _autoScrollController,
        widgetRef: ref);
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
                    child: Consumer(builder: (context, ref, child) {
                      final state = ref.watch(vocabularyUINotifierProvider);

                      if(state.itemList.isNotEmpty)
                        {
                          return ListView.builder(
                            scrollDirection: scrollDirection,
                            controller: _autoScrollController,
                            itemCount: state.itemList.length,
                            itemBuilder: (context, index) {
                              return AutoScrollTag(
                                  key: ValueKey(index),
                                  controller: _autoScrollController,
                                  index: index,
                                  child: VocabularyItemWidget(
                                    title: state.itemList[index].wordText,
                                    mean: state.itemList[index].meanText,
                                    example: state.itemList[index].exampleText,
                                    isSelected: state.itemList[index].isSelected,
                                    isCurrentPlaying: state.itemList[index].isPlaying,
                                    isEnableTitle: state.enableStudyTypeWord,
                                    isEnableMean: state.enableStudyTypeMean,
                                    isEnableExample: state.enableStudyTypeExample,
                                    lineCount: state.itemList[index].lineCount,
                                    onItemPressed: () {
                                      Logcats.message("item pressed : $index");
                                      _factoryController.onSelectItem(index);
                                    },
                                    onPlayIconPressed: () {
                                      Logcats.message("play pressed : $index");
                                      _factoryController.onPlayItem(index);
                                    },
                                  )
                              );
                            },);
                        }
                      else
                        {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.color_47e1ad,
                            ),
                          );
                        }
                    })
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
    final state = ref.watch(vocabularyUINotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            _factoryController.onClickSelectType(VocabularySelectType.ALL);
          },
          child: SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: Row(
              children: [
                Image.asset( state.enableStudyTypeAll ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
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
          child: SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: Row(
              children: [
                Image.asset(state.enableStudyTypeWord ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
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
          child: SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: Row(
              children: [
                Image.asset( state.enableStudyTypeMean ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
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
          child: SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: Row(
              children: [
                Image.asset( state.enableStudyTypeExample ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
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
  }

  Widget _buildBottomContentsLayout() {
    final isPlaying = ref.watch(vocabularyUINotifierProvider.select((it) => it.isPlaying));
    return Container(
      color: AppColors.color_29c8e6,
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(176),
      child: Row(
        children: [
          Consumer(builder: (context, ref, child) {
            final intervalIndexData = ref.watch(vocabularyUINotifierProvider.select((it) => it.intervalIndex));
            return BottomIconTextView(
              imageAssetUri: 'assets/image/bottom_interval.png',
              title: getIt<FoxschoolLocalization>().data['text_list_vocabulary_interval'][intervalIndexData],
              isPlaying: isPlaying,
              onPressed: isPlaying == false ? () {
                _factoryController.onClickInterval();
              } : null,
            );
          }),
          Consumer(builder: (context, ref, child) {
            final isHaveSelectedItem = ref.watch(vocabularyUINotifierProvider.select((it) => it.isHaveSelectedItem));
            return BottomIconTextView(
              imageAssetUri: isHaveSelectedItem ? 'assets/image/bottom_close.png' :  'assets/image/bottom_all.png',
              title: isHaveSelectedItem ? getIt<FoxschoolLocalization>().data['text_select_init'] :  getIt<FoxschoolLocalization>().data['text_select_all'],
              isPlaying: isPlaying,
              onPressed: isPlaying == false ? () async {
                _factoryController.onClickSelectAll();
              } : null,
            );
          }),
          Stack(
            children: [
              BottomIconTextView(
                  imageAssetUri: isPlaying ? 'assets/image/bottom_stop.png' : 'assets/image/bottom_play.png',
                  title: isPlaying ? getIt<FoxschoolLocalization>().data['text_stop_play'] : getIt<FoxschoolLocalization>().data['text_select_play'],
                  onPressed: () {
                    _factoryController.onClickSelectPlay();
                  }),
              Consumer(builder: (context, ref, child) {
                final selectItemCount = ref.watch(vocabularyUINotifierProvider.select((it) => it.selectItemCount));
                if (selectItemCount != 0) {
                  return Positioned(
                    right: selectItemCount < 100 ? CommonUtils.getInstance(context).getWidth(100) : CommonUtils.getInstance(context).getWidth(85),
                    top: CommonUtils.getInstance(context).getHeight(20),
                    child: Container(
                      width: selectItemCount < 100 ? CommonUtils.getInstance(context).getWidth(35) : CommonUtils.getInstance(context).getWidth(45),
                      height: CommonUtils.getInstance(context).getHeight(30),
                      decoration: BoxDecoration(color: AppColors.color_ffffff, borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(30))),
                      alignment: Alignment.center,
                      child: RobotoBoldText(
                        text: '${selectItemCount}',
                        fontSize: CommonUtils.getInstance(context).getWidth(20),
                        color: AppColors.color_29c8e6,
                        align: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              })
            ],
          ),

          BottomIconTextView(
              imageAssetUri: 'assets/image/bottom_voca.png',
              title: getIt<FoxschoolLocalization>().data['text_add_vocabulary'],
              isPlaying: isPlaying,
              onPressed: (){
                _factoryController.onClickAddVocabulary();
              }) ,

        ],
      ),
    );
  }

  Widget _buildBottomBookshelfLayout()
  {
    final isPlaying = ref.watch(vocabularyUINotifierProvider.select((it) => it.isPlaying));
    return Container(
      color: AppColors.color_29c8e6,
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(176),
      child: Row(
        children: [
          Consumer(builder: (context, ref, child) {
            final intervalIndexData = ref.watch(vocabularyUINotifierProvider.select((it) => it.intervalIndex));
            return BottomIconTextView(
              width: CommonUtils.getInstance(context).getWidth(210),
              imageAssetUri: 'assets/image/bottom_interval.png',
              title: getIt<FoxschoolLocalization>().data['text_list_vocabulary_interval'][intervalIndexData],
              isPlaying: isPlaying,
              onPressed: isPlaying == false ? () {
                _factoryController.onClickInterval();
              } : null,
            );
          }),
          Consumer(builder: (context, ref, child) {
            final isHaveSelectedItem = ref.watch(vocabularyUINotifierProvider.select((it) => it.isHaveSelectedItem));
            Logcats.message("------------- isHaveSelectedItem : ${isHaveSelectedItem}");
            return BottomIconTextView(
              width: CommonUtils.getInstance(context).getWidth(210),
              imageAssetUri: isHaveSelectedItem ? 'assets/image/bottom_close.png' :  'assets/image/bottom_all.png',
              title: isHaveSelectedItem ? getIt<FoxschoolLocalization>().data['text_select_init'] :  getIt<FoxschoolLocalization>().data['text_select_all'],
              isPlaying: isPlaying,
              onPressed: isPlaying == false ? () async {
                _factoryController.onClickSelectAll();
              } : null,
            );
          }),
          Stack(
            children: [
              BottomIconTextView(
                  width: CommonUtils.getInstance(context).getWidth(210),
                  imageAssetUri: isPlaying ? 'assets/image/bottom_stop.png' : 'assets/image/bottom_play.png',
                  title: isPlaying ? getIt<FoxschoolLocalization>().data['text_stop_play'] : getIt<FoxschoolLocalization>().data['text_select_play'],
                  onPressed: () {
                    _factoryController.onClickSelectPlay();
                  }),
              Consumer(builder: (context, ref, child) {
                final selectItemCount = ref.watch(vocabularyUINotifierProvider.select((it) => it.selectItemCount));
                if (selectItemCount != 0) {
                  return Positioned(
                    right: selectItemCount< 100 ? CommonUtils.getInstance(context).getWidth(100) : CommonUtils.getInstance(context).getWidth(85),
                    top: CommonUtils.getInstance(context).getHeight(20),
                    child: Container(
                      width: selectItemCount < 100 ? CommonUtils.getInstance(context).getWidth(35) : CommonUtils.getInstance(context).getWidth(45),
                      height: CommonUtils.getInstance(context).getHeight(30),
                      decoration: BoxDecoration(color: AppColors.color_ffffff, borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(30))),
                      alignment: Alignment.center,
                      child: RobotoBoldText(
                        text: '$selectItemCount',
                        fontSize: CommonUtils.getInstance(context).getWidth(20),
                        color: AppColors.color_29c8e6,
                        align: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              })
            ],
          ),
          BottomIconTextView(
            width: CommonUtils.getInstance(context).getWidth(210),
            imageAssetUri: 'assets/image/bottom_flashcard.png',
            title: getIt<FoxschoolLocalization>().data['text_flashcards'],
            isPlaying: isPlaying,
            onPressed: isPlaying == false ? () async {
            } : null,
          ) ,
          BottomIconTextView(
            width: CommonUtils.getInstance(context).getWidth(210),
            imageAssetUri: 'assets/image/bottom_delete.png',
            title: getIt<FoxschoolLocalization>().data['text_delete'],
            isPlaying: isPlaying,
            onPressed: isPlaying == false ? () async {
              _factoryController.onClickDeleteVocabularyItem();
            } : null,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _factoryController.dispose();
    _autoScrollController.dispose();

    super.dispose();
  }
}
