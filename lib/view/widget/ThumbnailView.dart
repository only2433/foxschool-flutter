import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';


class ThumbnailView extends StatelessWidget {

  final String id;
  final String imageUrl;
  final String title;
  int level;

  ThumbnailView({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    this.level = -1
  });

  @override
  Widget build(BuildContext context) {

    final List<String> RESOURCE_INDEX_IMAGE = [
      'assets/image/level01.png',
      'assets/image/level02.png',
      'assets/image/level03.png',
      'assets/image/level04.png',
      'assets/image/level05.png',
      'assets/image/level06.png',
      'assets/image/level07.png',
      'assets/image/level08.png',
      'assets/image/level09.png'
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: CommonUtils.getInstance(context).getHeight(394),
      color: AppColors.color_f5f5f5,
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: id,
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    width: CommonUtils.getInstance(context).getWidth(502),
                    height: CommonUtils.getInstance(context).getHeight(282),
                    fit: BoxFit.cover,
                    image: imageUrl),
              ),
              if(level >= 0)
                Positioned(
                  bottom: 0,
                  child: Image.asset(RESOURCE_INDEX_IMAGE[level - 1],
                    width: CommonUtils.getInstance(context).getWidth(65),
                    height: CommonUtils.getInstance(context).getWidth(55),
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(20),
          ),
          RobotoNormalText(
            text: title,
            fontSize: CommonUtils.getInstance(context).getWidth(38),
            color: AppColors.color_333333,
            align: TextAlign.center,)
        ],
      ),
    );
  }
}
