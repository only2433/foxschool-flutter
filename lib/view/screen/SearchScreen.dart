import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/search/factory/state/base/SeachListBaseState.dart';
import 'package:foxschool/bloc/search/SearchContentsListFactoryController.dart';
import 'package:foxschool/bloc/search/factory/cubit/SearchItemListCubit.dart';
import 'package:foxschool/bloc/search/factory/cubit/SearchTypeCubit.dart';
import 'package:foxschool/bloc/search/factory/state/SearchItemListState.dart';
import 'package:foxschool/bloc/search/factory/state/SearchTypeState.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/enum/SearchType.dart';
import 'package:foxschool/enum/TopTitleButtonType.dart';
import 'package:foxschool/view/widget/ContentsListItemView.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:foxschool/view/widget/TopTitleView.dart';

import '../../common/Common.dart';
import '../../common/CommonUtils.dart';
import '../../di/Dependencies.dart';
import '../../values/AppColors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchTitleTextController = TextEditingController();
  late ScrollController _scrollController;
  late SearchContentsListFactoryController _factoryController;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
   _factoryController = SearchContentsListFactoryController(context: context);
   _factoryController.init();

    _scrollController = ScrollController();
   _scrollController.addListener(() {
     _checkRefresh();
   });
   _settingFocusNode();

  }


  @override
  void activate() {
    super.activate();
    Logger.d("activate");
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
        Logger.d("fetchData");
        _factoryController.onFetchData();
      }
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
                  child: BlocBuilder<SearchItemListCubit, SearchListBaseState>(builder: (context, state) {

                    if(state is SearchItemListState)
                      {
                        return ListView.builder(
                            controller: _scrollController,
                            itemCount: state.list.length + 1,
                            itemBuilder: (context, index) {
                              if(index < state.list.length)
                                {
                                  return Padding(
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
                                      thumbnailUrl: state.list[index].thumbnailUrl,
                                      title: state.list[index].getContentsName(),
                                      onItemPressed: () {

                                      },
                                      onThumbnailPressed: () {
                                        Logger.d("");
                                      },
                                    ),
                                  );
                                }
                              else
                                {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: CommonUtils.getInstance(context).getHeight(150),
                                    child: state.isLoading ?
                                    Center(
                                      child: SizedBox(
                                          width: CommonUtils.getInstance(context).getWidth(50),
                                          height: CommonUtils.getInstance(context).getHeight(50),
                                          child: CircularProgressIndicator(color: AppColors.color_47e1ad)),
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
                    else if(state is LoadingState)
                      {
                        return Center(
                          child: CircularProgressIndicator(color: AppColors.color_47e1ad),
                        );
                      }
                    else
                      {
                        return Container();
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
    return BlocBuilder<SearchTypeCubit, SearchTypeState>(builder: (context, state) {
      Logger.d("state.type : ${state.type}");
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              _factoryController.onClickSearchType(SearchType.ALL);
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(150),
              height: CommonUtils.getInstance(context).getHeight(120),
              child: Row(
                children: [
                  Image.asset( state.type == SearchType.ALL ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
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
              _factoryController.onClickSearchType(SearchType.STORY);
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(150),
              height: CommonUtils.getInstance(context).getHeight(120),
              child: Row(
                children: [
                  Image.asset(state.type == SearchType.STORY ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
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
              _factoryController.onClickSearchType(SearchType.SONG);
            },
            child: Container(
              width: CommonUtils.getInstance(context).getWidth(150),
              height: CommonUtils.getInstance(context).getHeight(120),
              child: Row(
                children: [
                  Image.asset(state.type == SearchType.SONG ? 'assets/image/check_on.png' : 'assets/image/check_off.png',
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      );
    },
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
