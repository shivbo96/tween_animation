import 'package:flutter/material.dart';

import 'custom_button.dart';

const bgColor = [
  Color(0XFF8122BF),
  Color(0XFFCA32F5),
  Color(0XFFF2B634),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: bgColor, begin: Alignment(-1.0, -1.9), end: Alignment.topRight, tileMode: TileMode.mirror),
        ),
        child: Center(child: CustomButton()),
      ),
    );
  }
}
