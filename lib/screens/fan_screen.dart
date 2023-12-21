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

class MyProgressBar extends StatefulWidget {
  const MyProgressBar({
    super.key,
    required this.currentSize,
    required this.totalSize,
  });

  final int currentSize;
  final int totalSize;

  @override
  State<MyProgressBar> createState() => _MyProgressBarState();
}

class _MyProgressBarState extends State<MyProgressBar> {
  int currentSize = 1;

  @override
  void initState() {
    currentSize = widget.currentSize;
    super.initState();
  }

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
              width: ((currentSize / widget.totalSize) *
                      MediaQuery.of(context).size.width) +
                  getExtraSpace() +
                  30,
              margin: const EdgeInsets.all(8),
              // padding: const EdgeInsets.symmetric(horizontal: 10),
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
            decoration: BoxDecoration(
              border: Border.all(color: kcBGGrey),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            height: 10,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                widget.totalSize,
                (index) => Text(
                  "${index + 1}",
                  style: const TextStyle(fontSize: 9),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    divisions: widget.totalSize - 1,
                    value: currentSize.toDouble(),
                    thumbColor: Colors.transparent,
                    secondaryActiveColor: Colors.transparent,
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    min: 0,
                    max: (widget.totalSize - 1).toDouble(),
                    onChanged: (value) {
                      setState(() {
                        currentSize = value.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: ((currentSize / widget.totalSize) *
                    MediaQuery.of(context).size.width) +
                getExtraSpace(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 45,
                  height: 45,
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
                Container(
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

  num getExtraSpace() {
    int progress = (currentSize / (widget.totalSize - 1) * 100).toInt();

    switch (progress) {
      case 0:
        return 10;
      case 25:
        return 15;
      case 50:
        return 20;
      case 75:
        return 25;
      case 100:
      default:
        return 30;
    }
  }
}
