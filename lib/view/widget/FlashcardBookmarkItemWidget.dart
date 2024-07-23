import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';

class FlashcardBookmarkItemWidget extends StatelessWidget {
  final String wordText;
  final bool isBookmarked;
  final VoidCallback onCheckBookmark;
  const FlashcardBookmarkItemWidget({
    super.key,
    required this.wordText,
    required this.isBookmarked,
    required this.onCheckBookmark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CommonUtils.getInstance(context).getWidth(592),
      height: CommonUtils.getInstance(context).getHeight(178),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/flashcard_bookmark_item_bg.png'),
          fit: BoxFit.fill
        )
      ),
      child: Stack(
        children: [
          Center(
            child: RobotoNormalText(
                text: wordText,
                fontSize: CommonUtils.getInstance(context).getWidth(44),
                color: AppColors.color_444444),
          ),
          Positioned(
            top: CommonUtils.getInstance(context).getHeight(10),
            right: CommonUtils.getInstance(context).getWidth(20),
            child: GestureDetector(
              onTap: () {
                onCheckBookmark();
              },
              child: Container(
                width: CommonUtils.getInstance(context).getWidth(50),
                height: CommonUtils.getInstance(context).getHeight(50),
                padding: EdgeInsets.all(CommonUtils.getInstance(context).getWidth(5)),
                child: Image.asset(isBookmarked ? 'assets/image/flashcard_bookmark_on.png' : 'assets/image/flashcard_bookmark_off.png',
                    fit: BoxFit.contain),
              ),
            ),
          )
        ],
      ),
    );
  }
}
