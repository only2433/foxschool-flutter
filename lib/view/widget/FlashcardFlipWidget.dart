import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foxschool/view/widget/HtmlTextWidget.dart';
import 'package:foxschool/view/widget/RobotoBoldText.dart';
import 'package:foxschool/view/widget/RobotoRegularText.dart';

import '../../common/CommonUtils.dart';
import '../../values/AppColors.dart';
import 'dart:math' as math;

class FlashcardFlipWidget extends StatefulWidget {
  final int currentCount;
  final int maxCount;
  final String word;
  final String example;
  final String mean;
  bool isBookmark = false;
  final Function(bool isBookmarked) onCheckBookmark;
  FlashcardFlipWidget({
    super.key,
    required this.currentCount,
    required this.maxCount,
    required this.word,
    required this.example,
    required this.mean,
    required this.isBookmark,
    required this.onCheckBookmark});

  @override
  State<FlashcardFlipWidget> createState() => _FlashcardFlipWidgetState();
}

class _FlashcardFlipWidgetState extends State<FlashcardFlipWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFrontVisible = true;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)
    );
    _animation = Tween<double>(
        begin: 0,
        end: 1).animate(_controller)..addListener(() {
      if (_animation.value > 0.5 && _isFrontVisible) {
        setState(() {
          _isFrontVisible = false;
        });
      } else if (_animation.value <= 0.5 && !_isFrontVisible) {
        setState(() {
          _isFrontVisible = true;
        });
      }
    });
  }

  void _flipCard() {
    if (_controller.isAnimating) return;
    if (_isFrontVisible) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                  ..setEntry(3,2,0.001)
                  ..rotateX(_animation.value * math.pi),
                child: _isFrontVisible ? _buildFrontCard(context)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateX(math.pi),
                    child: _buildBackCard(context),
                ),
              );
            },
        ),
        SizedBox(
          height: CommonUtils.getInstance(context).getHeight(30),
        ),
        GestureDetector(
          onTap: _flipCard,
          child: Image.asset('assets/image/btn_flashcard_flip.png',
            width: CommonUtils.getInstance(context).getWidth(114),
            height: CommonUtils.getInstance(context).getHeight(123),
            fit: BoxFit.contain),
        )

      ],
    );
  }

  Widget _buildFrontCard(BuildContext context)
  {
    return Container(
      width: CommonUtils.getInstance(context).getWidth(1502),
      height: CommonUtils.getInstance(context).getHeight(690),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/flashcard_item_main_bg.png'),
          fit: BoxFit.contain
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: CommonUtils.getInstance(context).getWidth(180),
              right: CommonUtils.getInstance(context).getWidth(180),
              top: CommonUtils.getInstance(context).getHeight(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RobotoRegularText(
                    text: '${widget.currentCount}/${widget.maxCount}',
                    fontSize: CommonUtils.getInstance(context).getWidth(35),
                    color: AppColors.color_444444),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isBookmark = !widget.isBookmark;
                    });
                    widget.onCheckBookmark(widget.isBookmark);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: CommonUtils.getInstance(context).getHeight(5)
                    ),
                    child: Image.asset(widget.isBookmark ? 'assets/image/flashcard_bookmark_on.png' : 'assets/image/flashcard_bookmark_off.png',
                      width: CommonUtils.getInstance(context).getWidth(40),
                      height: CommonUtils.getInstance(context).getHeight(40),
                      fit: BoxFit.contain),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(10),
          ),
          Container(
            width: CommonUtils.getInstance(context).getWidth(1355),
            height: CommonUtils.getInstance(context).getHeight(266),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/flashcard_item_word_bg_front.png'),
                fit: BoxFit.contain
              )
            ),
            alignment: Alignment.center,
            child: RobotoBoldText(
              text: widget.word,
              fontSize: CommonUtils.getInstance(context).getWidth(70),
              color: AppColors.color_333333,
              align: TextAlign.center,
            ),
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(10),
          ),
          Container(
            width: CommonUtils.getInstance(context).getWidth(1352),
            height: CommonUtils.getInstance(context).getHeight(266),
            alignment: Alignment.topCenter,
            child: HtmlTextWidget(
              text: widget.example,
              fontSize: CommonUtils.getInstance(context).getWidth(42),
              color: AppColors.color_333333,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBackCard(BuildContext context)
  {
    return Container(
      width: CommonUtils.getInstance(context).getWidth(1502),
      height: CommonUtils.getInstance(context).getHeight(690),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/image/flashcard_item_main_bg.png'),
            fit: BoxFit.contain
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: CommonUtils.getInstance(context).getWidth(180),
                right: CommonUtils.getInstance(context).getWidth(180),
                top: CommonUtils.getInstance(context).getHeight(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RobotoRegularText(
                    text: '${widget.currentCount}/${widget.maxCount}',
                    fontSize: CommonUtils.getInstance(context).getWidth(35),
                    color: AppColors.color_444444),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isBookmark = !widget.isBookmark;

                    });
                    widget.onCheckBookmark(widget.isBookmark);
                  },
                  child: Image.asset(widget.isBookmark ? 'assets/image/flashcard_bookmark_on.png' : 'assets/image/flashcard_bookmark_off.png',
                      width: CommonUtils.getInstance(context).getWidth(40),
                      height: CommonUtils.getInstance(context).getHeight(40),
                      fit: BoxFit.contain),
                )
              ],
            ),
          ),
          SizedBox(
            height: CommonUtils.getInstance(context).getHeight(10),
          ),
          Container(
            width: CommonUtils.getInstance(context).getWidth(1352),
            height: CommonUtils.getInstance(context).getHeight(505),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/flashcard_item_word_bg_back.png'),
                fit: BoxFit.contain
              ),
            ),
            child: RobotoBoldText(
              text: widget.mean,
              fontSize: CommonUtils.getInstance(context).getWidth(70),
              color: AppColors.color_333333,
              align: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
