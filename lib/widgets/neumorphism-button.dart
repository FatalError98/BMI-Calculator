import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../constants.dart';
import '../global variables/globals.dart' as globals;

class NeumButton extends StatefulWidget {
  final Widget buttonChild;
  final double height;
  final double width;
  final Function onPressed;
  NeumButton(
      {required this.buttonChild,
      required this.height,
      required this.width,
      required this.onPressed});

  @override
  State<NeumButton> createState() => _NeumButtonState();
}

class _NeumButtonState extends State<NeumButton> {
  @override
  Widget build(BuildContext context) {
    Offset distance =
        globals.isPressed ? const Offset(2, 2) : const Offset(4, 4);
    double blur = globals.isPressed ? 6.0 : 15.0;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onPressed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 201),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: distance,
              blurRadius: blur,
              spreadRadius: 1,
              inset: globals.isPressed,
            ),
            BoxShadow(
              color: Colors.white,
              offset: -distance,
              blurRadius: blur,
              spreadRadius: 1,
              inset: globals.isPressed,
            ),
          ],
        ),
        child: Center(child: widget.buttonChild),
      ),
    );
  }
}
