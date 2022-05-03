import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  final String title;
  final String imgPath;
  final Color fontColor;
  const GenderContainer({
    Key? key,
    required this.title,
    required this.imgPath,
    required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          imgPath,
          scale: 5,
        ),
        Text(
          title,
          style: TextStyle(color: fontColor, fontSize: 17.0),
        ),
      ],
    );
  }
}
