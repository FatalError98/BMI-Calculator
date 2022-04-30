import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../widgets/neum_container.dart';
import '../widgets/gender_container.dart';
import '../global variables/globals.dart' as globals;
import '../widgets/neumorphism-button.dart';
import '../widgets/unit-switch.dart';
import '../constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color maleFontColor = activeFontColor;
  Color femaleBoxColor = inActiveColor;
  Color femaleFontColor = inActiveFontColor;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        maleFontColor = activeFontColor;
        femaleBoxColor = inActiveColor;
        femaleFontColor = inActiveFontColor;
      } else {
        maleBoxColor = inActiveColor;
        maleFontColor = inActiveFontColor;
        femaleBoxColor = activeColor;
        femaleFontColor = activeFontColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        femaleFontColor = activeFontColor;
        maleBoxColor = inActiveColor;
        maleFontColor = inActiveFontColor;
      } else {
        femaleBoxColor = inActiveColor;
        femaleFontColor = inActiveFontColor;
        maleBoxColor = activeColor;
        maleFontColor = activeFontColor;
      }
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (() {
                  setState(() {
                    updateBoxColor(1);
                  });
                }),
                child: NeumContainer(
                  color: maleBoxColor,
                  height: 150,
                  width: 150,
                  child: GenderContainer(
                    fontColor: maleFontColor,
                    title: 'Male',
                    imgPath: 'assets/icons/man.png',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    updateBoxColor(2);
                  });
                },
                child: NeumContainer(
                  color: femaleBoxColor,
                  height: 150,
                  width: 150,
                  child: GenderContainer(
                    fontColor: femaleFontColor,
                    title: 'Female',
                    imgPath: 'assets/icons/woman.png',
                  ),
                ),
              ),
            ],
          ),
          NeumContainer(
            color: bgColor,
            height: 150,
            width: 330,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    !globals.switchValues
                        ? 'Height: ${globals.heightValue.toInt()}'
                        : 'Height: ${(globals.heightValue / 30.48).toStringAsFixed(1)}',
                    style: const TextStyle(color: sFontColor, fontSize: 18.0),
                  ),
                  Slider(
                    value: globals.heightValue,
                    min: 80,
                    max: 240,
                    onChanged: (value) => setState(() {
                      globals.heightValue = value;
                    }),
                  ),
                  UnitSwitch(mainUnit: 'cm', secondaryUnit: 'ft'),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NeumContainer(
                color: bgColor,
                height: 150,
                width: 150,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(color: sFontColor, fontSize: 18.0),
                      ),
                      NumberPicker(
                        selectedTextStyle:
                            const TextStyle(color: pColor, fontSize: 20.0),
                        textStyle: const TextStyle(color: sFontColor),
                        axis: Axis.horizontal,
                        itemCount: 1,
                        minValue: 1,
                        maxValue: 500,
                        value: globals.weightValue,
                        onChanged: (val) => setState(
                          () {
                            globals.weightValue = val;
                          },
                        ),
                      ),
                      UnitSwitch(mainUnit: 'kg', secondaryUnit: 'lb'),
                    ]),
              ),
              NeumContainer(
                color: bgColor,
                height: 150,
                width: 150,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Age',
                        style: TextStyle(color: sFontColor, fontSize: 18.0),
                      ),
                      NumberPicker(
                        selectedTextStyle:
                            const TextStyle(color: pColor, fontSize: 20.0),
                        textStyle: const TextStyle(color: sFontColor),
                        axis: Axis.horizontal,
                        itemCount: 1,
                        minValue: 1,
                        maxValue: 130,
                        value: globals.ageValue,
                        onChanged: (val) => setState(() {
                          globals.ageValue = val;
                        }),
                      ),
                      const SizedBox(
                        height: 35,
                      )
                    ]),
              ),
            ],
          ),
          NeumButton(
            height: 40,
            width: 150,
            buttonChild: const Text(
              'Calculate',
              style: TextStyle(color: sFontColor, fontSize: 17.0),
            ),
            onPressed: () {
              var bmi = globals.weightValue /
                  (globals.heightValue * globals.heightValue);
              print(bmi);
            },
          ),
        ],
      ),
    );
  }
}
