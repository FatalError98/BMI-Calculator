import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import './global variables/globals.dart' as globals;
import './widgets/neumorphism-button.dart';
import './widgets/unit-switch.dart';
import './constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: pColor,
          secondary: sColor,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentValue = 80.0;
  int _currentWeightValue = 20;
  int _currentAgeValue = 18;

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
              NeumButton(bText: 'Male'),
              NeumButton(bText: 'Female'),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 150,
            width: 330,
            decoration: neumContanerEffect,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    !globals.switchValues
                        ? 'Height: ${_currentValue.toInt()}'
                        : 'Height: ${(_currentValue / 30.48).toStringAsFixed(1)}',
                    style: const TextStyle(color: sFontColor, fontSize: 18.0),
                  ),
                  Slider(
                    value: _currentValue,
                    min: 80,
                    max: 240,
                    onChanged: (value) => setState(() {
                      _currentValue = value;
                    }),
                  ),
                  UnitSwitch(mainUnit: 'cm', secondaryUnit: 'ft'),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 150,
                width: 150,
                decoration: neumContanerEffect,
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
                        value: _currentWeightValue,
                        onChanged: (val) => setState(() {
                          _currentWeightValue = val;
                        }),
                      ),
                      UnitSwitch(mainUnit: 'kg', secondaryUnit: 'lb'),
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 150,
                width: 150,
                decoration: neumContanerEffect,
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
                        value: _currentAgeValue,
                        onChanged: (val) => setState(() {
                          _currentAgeValue = val;
                        }),
                      ),
                      const SizedBox(
                        height: 35,
                      )
                    ]),
              ),
            ],
          ),
          NeumButton(bText: 'Calculate'),
        ],
      ),
    );
  }
}
