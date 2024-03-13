import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:foxschool/common/CommonUtils.dart';
import 'package:foxschool/view/widget/RobotoNormalText.dart';

class PercentLineProgressBar extends StatefulWidget {
  final double percent;
  final double width;
  final double height;
  final Color progressColor;

  const PercentLineProgressBar({
    super.key,
    required this.percent,
    required this.width,
    required this.height,
    required this.progressColor});

  @override
  State<PercentLineProgressBar> createState() => _PercentLineProgressBarState();
}

class _PercentLineProgressBarState extends State<PercentLineProgressBar> with TickerProviderStateMixin {

  late double _percent;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    settingAnimation();
  }

  @override
  void didUpdateWidget(covariant PercentLineProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent)
    {
      Logger.d("oldWidget.percent : ${oldWidget.percent}, widget.Percent : ${widget.percent}");
      settingAnimation();
    }
  }

  void settingAnimation()
  {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: widget.percent).animate(_controller)
      ..addListener(() {
        setState(() {
          _percent = _animation.value;
        });
      });
    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Logger.d("onDraw : ${_percent}");
    return _ProgressBar();
  }

  Widget _ProgressBar()
  {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.progressColor,
              width: CommonUtils.getInstance(context).getWidth(2)
          ),
          borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(25))
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                  width: widget.width * _percent/100,
                  height: widget.height,
                  decoration: BoxDecoration(
                      color: widget.progressColor,
                      borderRadius: BorderRadius.circular(CommonUtils.getInstance(context).getWidth(25))
                  )
              ),

              Positioned(
                  right: 10,
                  child: RobotoNormalText(
                    text: '${_percent.toStringAsFixed(0)}%',
                    fontSize: CommonUtils.getInstance(context).getWidth(30),
                  )
              )
            ],
          );
        },
      ),
    );
  }


}
