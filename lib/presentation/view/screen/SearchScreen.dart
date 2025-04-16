import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxschool/common/Common.dart';
import 'package:foxschool/common/LogCats.dart';
import 'package:foxschool/enum/SearchItemLoadType.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/SearchType.dart';
import 'package:foxschool/enum/TopTitleButtonType.dart';
import 'package:foxschool/presentation/controller/search/SearchFactoryController.dart';
import 'package:foxschool/presentation/controller/search/river_pod/SearchUINotifier.dart';
import 'package:foxschool/presentation/view/widget/ContentsListItemView.dart';
import 'package:foxschool/presentation/view/widget/RobotoNormalText.dart';
import 'package:foxschool/presentation/view/widget/TopTitleView.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/di/Dependencies.dart';
import 'package:foxschool/values/AppColors.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen>  with TickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchTitleTextController = TextEditingController();
  late ScrollController _scrollController;
  late SearchFactoryController _factoryController;
  late AnimationController _animationController;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
   _factoryController = SearchFactoryController(
       context: context,
       widgetRef: ref);
   _factoryController.init();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: Common.DURATION_NORMAL),
    );

   _scrollController = ScrollController();
   _scrollController.addListener(() {
     _checkRefresh();
   });
   _settingFocusNode();

  }


  @override
  void activate() {
    super.activate();
    Logcats.message("activate");
  }

  void _settingFocusNode() {
    _searchFocusNode = FocusNode();
    _searchFocusNode.addListener(() {
      setState(() {

      });
    });
  }
  void _disposeFocusNode() {
    _searchFocusNode.dispose();
  }

  void _checkRefresh()
  {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
      {
        Logcats.message("fetchData");
        _factoryController.onFetchData();
      }
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(searchUINotifierProvider);
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
                  title: getIt<FoxschoolLocalization>().data['text_search'],
                  type: TopTitleButtonType.CLOSE,
                  onPressed: () {
                    _factoryController.onBackPressed();
                  },
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: CommonUtils.getInstance(context).getHeight(290),
                  color: AppColors.color_ffffff,
                  child: Column(
                    children: [
                      SizedBox(
                          height: CommonUtils.getInstance(context).getHeight(10)
                      ),
                      _buildSelectItemLayout(),
                      SizedBox(
                        height: CommonUtils.getInstance(context).getHeight(5)
                      ),
                      _buildSearchTextFieldLayout()
                    ],
                  )
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: AppColors.color_edeef2,
                  child: Consumer(builder: (context, ref, child) {
                    if(state.itemLoadType == SearchItemLoadType.DEFAULT)
                    {
                      return Container();
                    }
                    else if(state.itemLoadType == SearchItemLoadType.INIT)
                    {
                      return const Center(
                        child: CircularProgressIndicator(color: AppColors.color_47e1ad),
                      );
                    }
                    else
                    {
                      _animationController.forward();
                      return ListView.builder(
                          controller: _scrollController,
                          itemCount: state.contentsList.length + 1,
                          itemBuilder: (context, index) {
                            if(index < state.contentsList.length)
                            {
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
                                          )
                                      )
                                  ),
                                child: Padding(
                                  padding: index == 0 ?
                                  EdgeInsets.only(
                                      top: CommonUtils.getInstance(context).getHeight(40),
                                      bottom: CommonUtils.getInstance(context).getHeight(20),
                                      left: CommonUtils.getInstance(context).getWidth(25),
                                      right: CommonUtils.getInstance(context).getWidth(25)
                                  ) : EdgeInsets.only(
                                      bottom: CommonUtils.getInstance(context).getHeight(20),
                                      left: CommonUtils.getInstance(context).getWidth(25),
                                      right: CommonUtils.getInstance(context).getWidth(25)
                                  ),
                                  child: ContentsListItemView(
                                    thumbnailUrl: state.contentsList[index].thumbnailUrl,
                                    title: state.contentsList[index].getContentsName(),
                                    onThumbnailPressed: () {
                                      Logcats.message("");
                                      _factoryController.onClickThumbnailItem(index);
                                    },
                                    onOptionPressed: () {
                                      _factoryController.onClickOption(index);
                                    },
                                  ),
                                ),
                              );
                            }
                            else
                            {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: CommonUtils.getInstance(context).getHeight(150),
                                child: state.itemLoadType == SearchItemLoadType.PAGING_LIST_LOADING ?
                                Center(
                                  child: SizedBox(
                                      width: CommonUtils.getInstance(context).getWidth(50),
                                      height: CommonUtils.getInstance(context).getHeight(50),
                                      child: const CircularProgressIndicator(color: AppColors.color_47e1ad)),
                                ) :
                                Center(
                                  child: Image.asset('assets/image/footer_logo132.png',
                                    width: CommonUtils.getInstance(context).getWidth(187),
                                    height: CommonUtils.getInstance(context).getHeight(97),
                                    fit: BoxFit.cover,),
                                ),
                              );
                            }
                          });

                    }
                  },),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  

  Widget _buildSelectItemLayout()
  {
    final state = ref.watch(searchUINotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            _animationController.reset();
            _factoryController.onClickSearchType(SearchType.ALL);
          },
          child: SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: Row(
              children: [
                Image.asset( state.searchType == SearchType.ALL ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
                  width: CommonUtils.getInstance(context).getWidth(60),
                  height: CommonUtils.getInstance(context).getHeight(60),
                ),
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(15),
                ),
                RobotoNormalText(
                  text: getIt<FoxschoolLocalization>().data['text_all'],
                  fontSize: CommonUtils.getInstance(context).getWidth(36),
                  color: AppColors.color_444444,)
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _animationController.reset();
            _factoryController.onClickSearchType(SearchType.STORY);
          },
          child: SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: Row(
              children: [
                Image.asset(state.searchType == SearchType.STORY ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
                  width: CommonUtils.getInstance(context).getWidth(60),
                  height: CommonUtils.getInstance(context).getHeight(60),
                ),
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(15),
                ),
                RobotoNormalText(
                  text: getIt<FoxschoolLocalization>().data['text_story'],
                  fontSize: CommonUtils.getInstance(context).getWidth(36),
                  color: AppColors.color_444444,)
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _animationController.reset();
            _factoryController.onClickSearchType(SearchType.SONG);
          },
          child: SizedBox(
            width: CommonUtils.getInstance(context).getWidth(150),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: Row(
              children: [
                Image.asset(state.searchType == SearchType.SONG ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
                  width: CommonUtils.getInstance(context).getWidth(60),
                  height: CommonUtils.getInstance(context).getHeight(60),
                ),
                SizedBox(
                  width: CommonUtils.getInstance(context).getWidth(15),
                ),
                RobotoNormalText(
                  text: getIt<FoxschoolLocalization>().data['text_song'],
                  fontSize: CommonUtils.getInstance(context).getWidth(36),
                  color: AppColors.color_444444,)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSearchTextFieldLayout()
  {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: CommonUtils.getInstance(context).getWidth(764),
            height: CommonUtils.getInstance(context).getHeight(120),
            child: TextFormField(
              key: const ValueKey(1),
              focusNode: _searchFocusNode,
              controller: _searchTitleTextController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.color_ffffff,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(30)),
                    child: Image.asset('assets/image/btn_tex_del.png',
                      width: CommonUtils.getInstance(context).getWidth(60),
                      height: CommonUtils.getInstance(context).getHeight(60),),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(CommonUtils.getInstance(context).getWidth(20)),
                          bottomLeft: Radius.circular(CommonUtils.getInstance(context).getWidth(20))
                      ),
                      borderSide: BorderSide(
                        color: AppColors.color_999999,
                        width: CommonUtils.getInstance(context).getWidth(1),
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(CommonUtils.getInstance(context).getWidth(20)),
                          bottomLeft: Radius.circular(CommonUtils.getInstance(context).getWidth(20))
                      ),
                      borderSide: BorderSide(
                        color: AppColors.color_29c8e6,
                        width: CommonUtils.getInstance(context).getWidth(1),
                      )
                  ),
                  contentPadding: EdgeInsets.only(
                      top: CommonUtils.getInstance(context).getWidth(2),
                      left: CommonUtils.getInstance(context).getWidth(30)
                  ),
                  hintText: getIt<FoxschoolLocalization>().data['text_input_search'],
                  hintStyle: TextStyle(
                      color: AppColors.color_cccccc,
                      fontWeight: FontWeight.normal,
                      fontSize: CommonUtils.getInstance(context).getWidth(42),
                      fontFamily: 'Roboto'
                  )
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _factoryController.onClickSearchExecute(_searchTitleTextController.text);
              _searchFocusNode.unfocus();
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(120),
              height: CommonUtils.getInstance(context).getHeight(120),
              decoration: BoxDecoration(
                  color: AppColors.color_29c8e6,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(CommonUtils.getInstance(context).getWidth(20)),
                    bottomRight: Radius.circular(CommonUtils.getInstance(context).getWidth(20)),
                  )
              ),
              child: Padding(
                padding: EdgeInsets.all(
                    CommonUtils.getInstance(context).getWidth(30)
                ),
                child: Image.asset('assets/image/icon_search_3.png',
                    width: CommonUtils.getInstance(context).getWidth(58),
                    height: CommonUtils.getInstance(context).getHeight(60),
                    fit: BoxFit.contain),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _factoryController.dispose();
    _scrollController.dispose();
    _searchTitleTextController.dispose();
    _disposeFocusNode();
    super.dispose();
  }

}
