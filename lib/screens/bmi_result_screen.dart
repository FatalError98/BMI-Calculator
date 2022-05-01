import 'package:flutter/material.dart';

import '../constants.dart';

class BmiResultScreen extends StatelessWidget {
  final double bmiResult;
  BmiResultScreen(this.bmiResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: pFontColor),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: pFontColor,
          ),
        ),
      ),
      body: Center(
        child: Text('Your result : $bmiResult'),
      ),
    );
  }
}
