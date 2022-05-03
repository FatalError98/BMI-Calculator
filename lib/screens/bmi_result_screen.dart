import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/neum_container.dart';

class BmiResultScreen extends StatelessWidget {
  final double bmiResult;
  BmiResultScreen(this.bmiResult);

  Widget bmiTable(double bmi) {
    if (bmi < 16) {
      return Column(
        children: [
          Image.asset('assets/images/exploding-head_1f92f.png'),
          lowSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Your weight is: ',
                style: weightMsg,
              ),
              Text('Severe Thinness', style: weightStyle)
            ],
          ),
        ],
      );
    } else if (bmi >= 16 && bmi <= 17) {
      return Column(
        children: [
          Image.asset('assets/images/face-screaming-in-fear_1f631.png'),
          lowSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Your weight is: ',
                style: weightMsg,
              ),
              Text('Moderate Thinness', style: weightStyle),
            ],
          ),
        ],
      );
    } else if (bmi >= 17 && bmi <= 18.5) {
      return Column(
        children: [
          Image.asset('assets/images/anxious-face-with-sweat_1f630.png'),
          lowSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Your weight is: ',
                style: weightMsg,
              ),
              Text('Mild Thinness', style: weightStyle),
            ],
          ),
        ],
      );
    } else if (bmi >= 18.5 && bmi <= 25) {
      return Column(
        children: [
          Image.asset('assets/images/smiling-face-with-sunglasses_1f60e.png'),
          lowSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Your weight is: ',
                style: weightMsg,
              ),
              Text('Normal', style: weightStyle),
            ],
          ),
        ],
      );
    } else if (bmi >= 25 && bmi <= 30) {
      return Column(
        children: [
          Image.asset('assets/images/downcast-face-with-sweat_1f613.png'),
          lowSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Your weight is: ',
                style: weightMsg,
              ),
              Text('Overweight', style: weightStyle),
            ],
          ),
        ],
      );
    } else if (bmi >= 30 && bmi <= 35) {
      return Column(
        children: [
          Image.asset('assets/images/anxious-face-with-sweat_1f630.png'),
          lowSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Your weight is: ',
                style: weightMsg,
              ),
              Text('Obese Class I', style: weightStyle),
            ],
          ),
        ],
      );
    } else if (bmi >= 35 && bmi <= 40) {
      return Column(
        children: [
          Image.asset('assets/images/face-screaming-in-fear_1f631.png'),
          lowSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Your weight is: ',
                style: weightMsg,
              ),
              Text('Obese Class II	', style: weightStyle),
            ],
          ),
        ],
      );
    } else if (bmi > 40) {
      return Column(
        children: [
          Image.asset('assets/images/exploding-head_1f92f.png'),
          lowSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Your weight is: ',
                style: weightMsg,
              ),
              Text('Obese Class III	', style: weightStyle),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Image.asset('assets/images/skull-and-crossbones_2620-fe0f.png'),
          lowSpacer,
          const Text('Are you even alive', style: weightStyle),
        ],
      );
    }
  }

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
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: NeumContainer(
                height: 300,
                width: 300,
                color: bgColor,
                child: Column(
                  children: [
                    lowSpacer,
                    const Text(
                      'Your BMI is',
                      style: TextStyle(
                          color: pFontColor,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300),
                    ),
                    lowSpacer,
                    Text(
                      bmiResult.toStringAsFixed(1),
                      style: const TextStyle(
                          color: pColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'kg/m2',
                      style: TextStyle(
                        color: sFontColor,
                      ),
                    ),
                    mediamSpacer,
                    bmiTable(bmiResult),
                  ],
                ),
              ),
            ),
            highSpacer,
            const Text(
              'Healthy BMI range: 18.5 kg/m2 - 25 kg/m2',
              style: weightMsg,
            )
          ],
        ),
      ),
    );
  }
}
