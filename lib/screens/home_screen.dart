import 'dart:math';

import 'package:bmw_demo/constants/my_images.dart';
import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:bmw_demo/screens/fan_screen.dart';
import 'package:bmw_demo/widgets/background_container.dart';
import 'package:bmw_demo/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../constants/my_colors.dart';
import '../constants/my_font_icons.dart';
import 'common_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -90,
                child: _bBuildLeftColumn(isRight: false),
              ),
              Positioned(
                right: -90,
                child: _bBuildRightColumn(),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    bTopText(),
                    bI4Image(),
                    const SizedBox(height: 30),
                    _buildBWMimage(),
                    const SizedBox(height: 30),
                    _buildRange(),
                    const SizedBox(height: 30),
                    _buildPercentage(),
                    const SizedBox(height: 30),
                    _buildTemprature(),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
              _bBuildSettingsButton(context),
              _bBMWbutton(),
            ],
          ),
        ),
      ),
    );
  }

  _bBuildLeftColumn({bool isRight = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        MyNewPolygonButton(
          sides: 6,
          icon: MyFontIcons.car,
          isLeft: !isRight,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isRight) const SizedBox(width: 30),
            MyNewPolygonButton(
              isLeft: !isRight,
              icon: MyFontIcons.airlineSeat,
            ),
            if (isRight) const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 5),
        MyNewPolygonButton(
          sides: 6,
          isLeft: !isRight,
          icon: MyFontIcons.fan,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  _bBuildRightColumn({bool isRight = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        MyNewPolygonButton(
          sides: 6,
          isLeft: !isRight,
          icon: MyFontIcons.icq,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isRight) const SizedBox(width: 30),
            MyNewPolygonButton(
              isLeft: !isRight,
              icon: MyFontIcons.location,
            ),
            if (isRight) const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 5),
        MyNewPolygonButton(
          sides: 6,
          isLeft: !isRight,
          icon: MyFontIcons.stopwatch,
        ),
        const SizedBox(height: 30),
      ],
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


  Positioned _bBMWbutton() {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Column(
        children: [
          MyRoundButton(
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
          const SizedBox(height: 20),
          Text(
            "Start Engine",
            style: ktBody.copyWith(
              fontSize: 12,
              color: kcSecondaryStart,
            ),
          )
        ],
      ),
    );
  }

  _bBuildSettingsButton(BuildContext context) {
    return Positioned(
      top: 20,
      right: 10,
      child: MyRoundButton(
        icon: const Icon(MyFontIcons.cog),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FanScreen(),
          ));
        },
      ),
    );
  }

  _buildTemprature() {
    return const TextValueWidget(label: "Temprature", value: "26° C");
  }

  _buildPercentage() {
    return const TextValueWidget(
        label: "Battery", value: "60%", valueTextStyle: ktHeading1);
  }

  _buildRange() {
    return const TextValueWidget(label: "Range", value: "260 KM");
  }
}

class MyNewPolygonButton extends StatelessWidget {
  const MyNewPolygonButton({
    super.key,
    this.sides = 3,
    this.isLeft = true,
    required this.icon,
  });

  final double sides;
  final IconData icon;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: sides == 3 ? -pi / (isLeft ? 2 : 6) : -pi / 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 160,
                width: 160,
                decoration: ShapeDecoration(
                  shape: StarBorder.polygon(sides: sides, pointRounding: 0.3),
                  gradient: const LinearGradient(
                    colors: [kcBlack, kcBG, kcBlack],
                  ),
                  shadows: [
                    const BoxShadow(
                      color: Colors.white10,
                      offset: Offset(-2.67, 2.67),
                      blurRadius: 6.34,
                      spreadRadius: 0.4,
                    ),
                    BoxShadow(
                      color: isLeft ? Colors.black38 : Colors.white30,
                      offset: const Offset(-2.67, -2.67),
                      blurRadius: 10.34,
                      spreadRadius: 0.6,
                    ),
                    BoxShadow(
                      color: isLeft ? Colors.white30 : Colors.black38,
                      offset: const Offset(2.67, 2.67),
                      blurRadius: 5.34,
                      spreadRadius: 0.6,
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 150,
                height: 150,
                decoration: ShapeDecoration(
                  shape: StarBorder.polygon(sides: sides, pointRounding: 0.26),
                  color: kcBGDark,
                ),
                child: Container(),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(
              isLeft
                  ? 15
                  : sides == 3
                      ? -10
                      : -25,
              0),
          child: Icon(
            icon,
            color: kcSecondaryEnd,
            size: 30,
          ),
        )
      ],
    );
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
