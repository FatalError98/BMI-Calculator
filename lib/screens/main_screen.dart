import 'dart:math';

import 'package:bmicalculator/screens/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../widgets/neum_container.dart';
import '../widgets/gender_container.dart';
import '../global variables/globals.dart' as globals;
// import '../widgets/unit-switch.dart';
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
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        femaleFontColor = activeFontColor;
        maleBoxColor = inActiveColor;
        maleFontColor = inActiveFontColor;
      }
    }
  }

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return BmiResultScreen(globals.bmi);
        },
      ),
    );
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
            height: 170,
            width: 330,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(color: sFontColor, fontSize: 18.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // !globals.switchValues
                        //     ?
                        '${globals.heightValue.toInt()}',
                        // : (globals.heightValue / 30.48).toStringAsFixed(1),
                        style: const TextStyle(
                          color: sFontColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        // !globals.switchValues ?
                        ' cm',
                        // : ' ft',
                        style: TextStyle(color: sFontColor, fontSize: 18.0),
                      ),
                    ],
                  ),
                  Slider(
                    value: globals.heightValue,
                    min: 50,
                    max: 250,
                    onChanged: (value) => setState(() {
                      globals.heightValue = value;
                    }),
                  ),
                  // UnitSwitch(mainUnit: 'cm', secondaryUnit: 'ft'),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              heroTag: 'btn1',
                              onPressed: () => setState(() {
                                globals.weightValue++;
                              }),
                              child: const Icon(Icons.add),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              heroTag: 'btn2',
                              onPressed: () => setState(() {
                                if (globals.weightValue > 0)
                                  globals.weightValue--;
                              }),
                              child: const Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                      // UnitSwitch(mainUnit: 'kg', secondaryUnit: 'lb'),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              heroTag: 'btn3',
                              onPressed: () => setState(() {
                                globals.ageValue++;
                              }),
                              child: const Icon(Icons.add),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              heroTag: 'btn4',
                              onPressed: () => setState(() {
                                if (globals.ageValue > 0) globals.ageValue--;
                              }),
                              child: const Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              globals.bmi =
                  // !globals.switchValues
                  //     ?
                  globals.weightValue / pow(globals.heightValue / 100, 2.0);
              // : 703 *
              //     (globals.weightValue /
              //         pow(globals.heightValue * 12, 2.0));
              // print(bmi.toStringAsFixed(1));
              selectCategory(context);
            },
            child: NeumContainer(
              color: pColor,
              height: 50,
              width: 160,
              child: const Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(color: bgColor, fontSize: 17.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
