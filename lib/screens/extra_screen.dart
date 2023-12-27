import 'package:bmw_demo/constants/my_colors.dart';
import 'package:bmw_demo/widgets/background_container.dart';
import 'package:bmw_demo/widgets/my_new_progress_slider.dart';
import 'package:flutter/material.dart';

class MyExtraScreen extends StatefulWidget {
  const MyExtraScreen({super.key});

  @override
  State<MyExtraScreen> createState() => _MyExtraScreenState();
}

class _MyExtraScreenState extends State<MyExtraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomSlider(
              inActiveTrackColor: kcBGGrey,
              activeTrackColor: kcSecondaryDark,
              activeInnerTrackColor: kcSecondaryEnd,
              trackHeight: 5,
              divisions: 5,
              min: 0,
              max: 5,
            )
          ],
        ),
      ),
    );
  }
}
