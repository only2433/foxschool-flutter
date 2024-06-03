
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  Color color;
  HtmlTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      text,
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto',
        fontSize: fontSize,
      ),
    );
  }
}