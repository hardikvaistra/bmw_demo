import 'package:bmw_demo/constants/my_colors.dart';
import 'package:bmw_demo/constants/my_font_icons.dart';
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
