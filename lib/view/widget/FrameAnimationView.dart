import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

class FrameAnimationView extends StatefulWidget {
  final double width;
  final double height;
  final Duration duration;
  final bool isStart;
  const FrameAnimationView({
    super.key,
    required this.width,
    required this.height,
    required this.duration,
    required this.isStart});

  @override
  State<FrameAnimationView> createState() => _FrameAnimationViewState();
}

class _FrameAnimationViewState extends State<FrameAnimationView> with SingleTickerProviderStateMixin {

  final List<String> ANIMATION_PATH = [
    "asset/image/intro_img01.png",
    "asset/image/intro_img02.png",
    "asset/image/intro_img03.png",
    "asset/image/intro_img04.png",
    "asset/image/intro_img05.png"
  ];

  late AnimationController _controller;
  late Animation<int> _animation;
  late bool isStart;
  int _animationIndex = 0;


  @override
  void initState() {
    super.initState();
    _settingAnimation();
    isStart = false;
    _animationIndex = 0;
  }


  @override
  void didUpdateWidget(FrameAnimationView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isStart != widget.isStart)
    {
      isStart = widget.isStart;

      if(isStart)
      {
        _controller.repeat();
      }
      else
      {
        _controller.stop();
      }
    }
  }

  void _settingAnimation()
  {
    _controller = AnimationController(vsync: this, duration: widget.duration * ANIMATION_PATH.length);
    _animation = StepTween(begin: 0, end: ANIMATION_PATH.length - 1).animate(_controller);
    _animation.addListener(() {
      _animationIndex = _animation.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Image.asset(ANIMATION_PATH[_animationIndex],
              width: widget.width,
              height: widget.height);
        },);
  }


}
