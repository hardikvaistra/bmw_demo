import 'package:bmw_demo/constants/my_colors.dart';
import 'package:bmw_demo/constants/my_font_icons.dart';
import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:bmw_demo/widgets/background_container.dart';
import 'package:bmw_demo/widgets/my_button.dart';
import 'package:flutter/material.dart';

import 'common_ui.dart';

class FanScreen extends StatelessWidget {
  const FanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundContainer(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyRoundButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 24,
                        color: Colors.grey,
                      ),
                      onPressed: Navigator.of(context).pop,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        bTopText(fontSize: 18),
                        bI4Image(imageSize: 40),
                      ],
                    ),
                    MyRoundButton(
                      iconData: MyFontIcons.more,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(child: Column()),
              Expanded(child: Column()),
              const Text("Fan Speed", style: ktBody),
              const MyProgressBar(totalSize: 5, currentSize: 4),
              const Text("Mode", style: ktBody),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyRoundButton(
                      icon: const Icon(
                        Icons.ac_unit,
                        size: 24,
                        color: Colors.white,
                      ),
                      gradeintColors: const [
                        kcSecondaryEnd,
                        kcSecondaryStart,
                        kcSecondaryStart,
                      ],
                      onPressed: () {},
                    ),
                    MyRoundButton(
                      iconData: MyFontIcons.waves,
                      onPressed: () {},
                    ),
                    MyRoundButton(
                      iconData: MyFontIcons.sun,
                      onPressed: () {},
                    ),
                    MyRoundButton(
                      iconData: MyFontIcons.stopwatch,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyProgressBar extends StatelessWidget {
  const MyProgressBar({
    super.key,
    required this.currentSize,
    required this.totalSize,
  });

  final int currentSize;
  final int totalSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 10,
              width: ((currentSize / totalSize) *
                      MediaQuery.of(context).size.width) +
                  30,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kcSecondaryEnd, kcSecondaryStart],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Container(
            height: 10,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                totalSize,
                (index) => Text(
                  "${index + 1}",
                  style: const TextStyle(fontSize: 9),
                ),
              ),
            ),
          ),
          Positioned(
            left: ((currentSize / totalSize) *
                    MediaQuery.of(context).size.width) +
                30,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white10,
                        offset: Offset(-4.67, 0),
                        blurRadius: 60.34,
                        spreadRadius: 0.4,
                      ),
                      BoxShadow(
                        color: Colors.white30,
                        offset: Offset(-4.67, -4.67),
                        blurRadius: 10.34,
                        spreadRadius: 0.6,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4.67, 4.67),
                        blurRadius: 5.34,
                        spreadRadius: 0.6,
                      ),
                      BoxShadow(
                        color: Colors.white30,
                        blurRadius: 5.34,
                        spreadRadius: -10.6,
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [kcBlack, kcBGGrey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Text((currentSize + 1).toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
