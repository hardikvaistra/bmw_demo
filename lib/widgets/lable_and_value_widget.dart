import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:flutter/material.dart';

class TextValueWidget extends StatelessWidget {
  const TextValueWidget({
    super.key,
    required this.label,
    required this.value,
    this.valueTextStyle,
  });

  final String label;
  final String value;
  final TextStyle? valueTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: ktLabel),
        const SizedBox(height: 6),
        Text(value, style: valueTextStyle ?? ktBody),
      ],
    );
  }
}
