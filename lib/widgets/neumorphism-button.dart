import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../constants.dart';

class NeumButton extends StatefulWidget {
  final String bText;
  NeumButton({required this.bText});

  @override
  State<NeumButton> createState() => _NeumButtonState();
}

class _NeumButtonState extends State<NeumButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    Offset distance = _isPressed ? const Offset(2, 2) : const Offset(4, 4);
    double blur = _isPressed ? 6.0 : 15.0;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 201),
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: distance,
              blurRadius: blur,
              spreadRadius: 1,
              inset: _isPressed,
            ),
            BoxShadow(
              color: Colors.white,
              offset: -distance,
              blurRadius: blur,
              spreadRadius: 1,
              inset: _isPressed,
            ),
          ],
        ),
        child: Center(child: Text(widget.bText)),
      ),
    );
  }
}
