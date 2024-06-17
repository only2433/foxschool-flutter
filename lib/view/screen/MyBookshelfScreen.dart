
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/series_contents_list/factory/cubit/SeriesEnableBottomViewCubit.dart';
import '../../bloc/series_contents_list/factory/cubit/SeriesItemListCubit.dart';
import '../../bloc/series_contents_list/factory/cubit/SeriesSelectItemCountCubit.dart';
import '../../enum/TopTitleButtonType.dart';
import '../../values/AppColors.dart';
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
          BlocProvider(create: (context) => SeriesEnableBottomViewCubit()),
          BlocProvider(create: (context) => SeriesItemListCubit()),
          BlocProvider(create: (context) => SeriesSelectItemCountCubit()),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: MyBookshelfContentsView(
            id: id,
            title: title,
          ),
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

class _MyBookshelfContentsViewState extends State<MyBookshelfContentsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
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

              },
            ),
          ],
        ),
      ),
    );
  }
}

