import 'package:bmw_demo/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyCircularProgressSlider extends StatelessWidget {
  final Size size;
  const MyCircularProgressSlider({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _topCircle(),
      ],
    );
  }

  Container _topCircle() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kcBGDark,
        border: Border.all(color: kcBGGrey, width: 3),
      ),
      height: size.height * 0.4,
      width: size.height * 0.4,
    );
  }
}
