import 'package:flutter/material.dart';

import '../constants.dart';

class NeumContainer extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final Widget child;

  NeumContainer(
      {required this.child,
      required this.height,
      required this.width,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: shadowColor,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: child);
  }
}
