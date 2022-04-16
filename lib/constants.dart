import 'package:flutter/material.dart';

//Color palette
// const bgColor = Color.fromRGBO(245, 246, 250, 1);
const bgColor = Color.fromARGB(255, 224, 224, 224);
const pColor = Color.fromRGBO(140, 122, 230, 1);
const sColor = Color.fromRGBO(156, 136, 255, 1);
const pFontColor = Color.fromRGBO(87, 96, 111, 1);
const sFontColor = Color.fromRGBO(116, 125, 140, 1);
const shadowColor = Color.fromARGB(255, 158, 158, 158);
BoxDecoration neumContanerEffect = BoxDecoration(
  color: bgColor,
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
);
