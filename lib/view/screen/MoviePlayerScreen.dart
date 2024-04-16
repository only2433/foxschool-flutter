import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/bloc/base/MoviePlayerBaseState.dart';
import 'package:foxschool/bloc/movie/MovieFactoryController.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayListCubit.dart';
import 'package:foxschool/bloc/movie/factory/cubit/MoviePlayerChangeCubit.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayListState.dart';
import 'package:foxschool/bloc/movie/factory/state/MoviePlayerReadyState.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/common/FoxschoolLocalization.dart';
import 'package:foxschool/view/widget/ContentsListItemView.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:video_player/video_player.dart';

import '../../data/contents/contents_base/ContentsBaseResult.dart';
import '../../di/Dependencies.dart';
import '../../values/AppColors.dart';


class MoviePlayerScreen extends StatefulWidget {

  final List<ContentsBaseResult> playList;
  const MoviePlayerScreen({super.key,
    required this.playList}
      );

  @override
  State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  late MovieFactoryController _factoryController;


  @override
  void initState() 
  {
    super.initState();
    _factoryController = MovieFactoryController(context: context, playList: widget.playList);
    _factoryController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_000000,
      body: SafeArea(
        child: Column(
          children: [

              BlocBuilder<MoviePlayerChangeCubit, MoviePlayerBaseState>(builder: (context, state) {
                if(state is LoadingState)
                {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: CommonUtils.getInstance(context).getHeight(602),
                        color: AppColors.color_000000,
                        child: const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.color_47e1ad)
                        )
                    );
                }
                else if(state is MoviePlayerReadyState)
                {
                    return AspectRatio(
                        aspectRatio: state.controller.value.aspectRatio,
                        child: VideoPlayer(state.controller)
                    );
                }
                else
                {
                  return Container();
                }
              },),
            Expanded(
                child: Container(
                  color: AppColors.color_edeef2,
                  child: Column(
                    children: [
                      _getPlayerTitleLayout(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: CommonUtils.getInstance(context).getHeight(120),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                          left: CommonUtils.getInstance(context).getWidth(40)
                        ),
                        child: RobotoNormalText(
                          text: getIt<FoxschoolLocalization>().data['title_play_list_title'],
                          color: AppColors.color_000000,
                          fontSize: CommonUtils.getInstance(context).getWidth(40),
                        ),
                      ),
                      _getPlayListView()
                    ],
                  ),
                )
            )
          ],
        ),
      )
    );
  }

  Widget _getPlayerTitleLayout()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(205),
      color: AppColors.color_ffffff,
      child: Stack(
        children: [
          Positioned(
              left: CommonUtils.getInstance(context).getWidth(45),
              top: CommonUtils.getInstance(context).getHeight(5),
              width: CommonUtils.getInstance(context).getWidth(950),
              height: CommonUtils.getInstance(context).getHeight(200),
              child: Center(
                child: RobotoNormalText(
                  text: 'Tire Town School 1 : Eddy`s First Day',
                  fontSize: CommonUtils.getInstance(context).getWidth(46),
                  color: AppColors.color_000000,
                  align: TextAlign.center,
                  maxLines: 2,
                ),
              )
          ),
          Positioned(
              top: CommonUtils.getInstance(context).getHeight(40),
              right: CommonUtils.getInstance(context).getWidth(30),
              child: Image.asset(
                'asset/image/icon_learning.png',
                width: CommonUtils.getInstance(context).getWidth(92),
                height: CommonUtils.getInstance(context).getHeight(125),
              )
          )
        ],
      ),
    );
  }

  Widget _getPlayListView()
  {
    return BlocBuilder<MoviePlayListCubit, MoviePlayListState>(builder: (context, state) {

      if(state.list.isNotEmpty)
        {
          return Expanded(
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: CommonUtils.getInstance(context).getWidth(25),
                      right: CommonUtils.getInstance(context).getWidth(25),
                      bottom: CommonUtils.getInstance(context).getHeight(20)
                  ),
                child: ContentsListItemView(
                  thumbnailUrl: state.list[index].thumbnailUrl,
                  title: state.list[index].getContentsName(),
                  isSelected: state.list[index].isSelected,
                  onThumbnailPressed: () {

                  },
                  onItemPressed: () {

                  },
                ),
              );
            },),
          );
        }
      else
        {
          return Container();
        }
    },);
  }

  @override
  void dispose() {
    Logger.d("dispose");
    _factoryController.dispose();
    super.dispose();
  }
}

