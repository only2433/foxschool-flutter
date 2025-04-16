import 'package:flutter/material.dart';

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
    "assets/image/intro_img01.png",
    "assets/image/intro_img02.png",
    "assets/image/intro_img03.png",
    "assets/image/intro_img04.png",
    "assets/image/intro_img05.png"
  ];

  late AnimationController _controller;
  late Animation<int> _animation;
  late bool _isStart;
  int _animationIndex = 0;

  void _settingAnimation()
  {
    _animationIndex = 0;

    _controller = AnimationController(vsync: this, duration: widget.duration * ANIMATION_PATH.length);
    _animation = StepTween(begin: 0, end: ANIMATION_PATH.length - 1).animate(_controller);
    _animation.addListener(() {
      _animationIndex = _animation.value;
    });

    if(widget.isStart)
    {
      _controller.repeat();
    }
  }


  @override
  void initState() {
    super.initState();
    _settingAnimation();
  }


  @override
  void didUpdateWidget(FrameAnimationView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isStart != widget.isStart)
    {
      _isStart = widget.isStart;

      if(_isStart)
      {
        _controller.repeat();
      }
      else
      {
        _controller.stop();
      }
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
