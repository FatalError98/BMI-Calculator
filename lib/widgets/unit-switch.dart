import 'package:flutter/material.dart';

import '../global variables/globals.dart' as globals;
import '../constants.dart';

class UnitSwitch extends StatefulWidget {
  final String mainUnit;
  final String secondaryUnit;

  UnitSwitch({
    required this.mainUnit,
    required this.secondaryUnit,
  });

  @override
  State<UnitSwitch> createState() => _UnitSwitchState();
}

class _UnitSwitchState extends State<UnitSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 120,
      decoration: BoxDecoration(
        color: pColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.mainUnit,
            style: const TextStyle(
              color: sFontColor,
              fontStyle: FontStyle.italic,
              fontSize: 16.0,
            ),
          ),
          Switch(
            activeColor: pColor,
            inactiveThumbColor: sColor,
            value: globals.switchValues,
            onChanged: (val) {
              setState(() {
                globals.switchValues = val;
              });
              print(globals.switchValues);
            },
          ),
          Text(
            widget.secondaryUnit,
            style: const TextStyle(
              color: sFontColor,
              fontStyle: FontStyle.italic,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
