import 'package:flutter/material.dart';

import './widgets/neumorphism-button.dart';
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
  bool _value = false;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 350,
                width: 150,
                decoration: neumContanerEffect,
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        color: pColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('cm'),
                          Switch(
                            activeColor: pColor,
                            inactiveThumbColor: sColor,
                            value: _value,
                            onChanged: (val) {
                              setState(() {
                                _value = val;
                              });
                            },
                          ),
                          const Text('ft')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: neumContanerEffect,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: neumContanerEffect,
                  ),
                ],
              ),
            ],
          ),
          NeumButton(bText: 'Calculate'),
        ],
      ),
    );
  }
}
