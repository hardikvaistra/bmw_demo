import 'package:bmw_demo/constants/my_images.dart';
import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:bmw_demo/widgets/background_container.dart';
import 'package:bmw_demo/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../constants/my_colors.dart';
import '../constants/my_font_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _bTopText(),
                    _bI4Image(),
                    const SizedBox(height: 30),
                    _buildBWMimage(),
                    const SizedBox(height: 30),
                    _buildRange(),
                    const SizedBox(height: 30),
                    _buildPercentage(),
                    const SizedBox(height: 30),
                    _buildTemprature(),
                    const SizedBox(height: 30),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              _bBuildSettingsButton(),
              _bBMWbutton(),
            ],
          ),
        ),
      ),
    );
  }

  Visibility _buildBWMimage() {
    return Visibility.maintain(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          kIi4front,
          width: 140,
        ),
      ),
    );
  }

  Image _bI4Image() {
    return Image.asset(
      kIi4Name,
      height: 60,
    );
  }

  RichText _bTopText() {
    return RichText(
      text: const TextSpan(
        text: "BMW",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 28,
        ),
        children: [
          TextSpan(
            text: "Concept",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }

  Positioned _bBMWbutton() {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: MyRoundButton(
        height: 105,
        width: 105,
        gradeintColors: const [
          kcSecondaryStart,
          kcSecondaryStart,
          kcSecondaryEnd
        ],
        image: Image.asset(
          kIBMWLogo,
          height: 40,
          width: 40,
        ),
        onPressed: () {},
      ),
    );
  }

  _bBuildSettingsButton() {
    return Positioned(
      top: 20,
      right: 10,
      child: MyRoundButton(
        icon: MyFontIcons.cog,
        onPressed: () {},
      ),
    );
  }

  _buildTemprature() {
    return const TextValueWidget(label: "Temprature", value: "26 C");
  }

  _buildPercentage() {
    return const TextValueWidget(
        label: "Battery", value: "60%", valueTextStyle: ktHeading1);
  }

  _buildRange() {
    return const TextValueWidget(label: "Range", value: "260 KM");
  }
}

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
