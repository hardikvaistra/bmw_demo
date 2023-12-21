import 'package:flutter/material.dart';

import '../constants/my_images.dart';

Image bI4Image({double imageSize = 60}) {
  return Image.asset(
    kIi4Name,
    height: imageSize,
  );
}

RichText bTopText({double fontSize = 28}) {
  return RichText(
    text:  TextSpan(
      text: "BMW",
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
      ),
      children: [
        TextSpan(
          text: "Concept",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: fontSize,
          ),
        ),
      ],
    ),
  );
}
