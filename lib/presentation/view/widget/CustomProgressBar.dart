import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
  final double initialPercent;

  const CustomProgressBar({
    Key? key,
    required this.initialPercent,
  }) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  late double _percent;

  @override
  void initState() {
    super.initState();
    _percent = widget.initialPercent;
  }


  void _updatePercent(double newPercent) {
    setState(() {
      _percent = newPercent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // 너비는 예시로 지정된 값입니다.
      height: 20, // 높이는 예시로 지정된 값입니다.
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: widget.initialPercent * 2, // 퍼센트에 따라 너비가 변경됩니다.
            height: 20, // 높이는 예시로 지정된 값입니다.
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Center(
            child: Text(
              '${widget.initialPercent.toInt()}%', // 퍼센트를 화면에 표시합니다.
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}