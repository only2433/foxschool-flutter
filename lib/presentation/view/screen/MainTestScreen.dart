
import 'package:flutter/material.dart';
import 'package:foxschool/common/CommonUtils.dart';

class MainTestScreen extends StatefulWidget {
  const MainTestScreen({super.key});

  @override
  State<MainTestScreen> createState() => _MainTestScreenState();
}

class _MainTestScreenState extends State<MainTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          "메인 페이지",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: CommonUtils.getInstance(context).getWidth(42),
            fontFamily: 'Roboto'
          ),
        ),
      ),
    );
  }
}
