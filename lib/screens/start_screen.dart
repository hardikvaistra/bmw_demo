import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:bmw_demo/screens/home_screen.dart';
import 'package:bmw_demo/widgets/background_container.dart';
import 'package:bmw_demo/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/my_colors.dart';
import 'dart:ui' as ui;
import '../constants/my_images.dart';
import '../utils/sound_pool_singleton.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    SoundPoolSingleton.instance.loadSound(soundAsset: "sounds/bmw.mp3");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BackgroundContainer(
        child: Stack(
          children: [
            // SmokeEffect(),

            _bUIStripH(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _bTopText(),
                _bI4Image(),
                const SizedBox(height: 30),
                _buildBWMimage(),
                const SizedBox(height: 20),
                _bBottomText(),
              ],
            ),
            _bStartButton(),
          ],
        ),
      ),
    );
  }

  Positioned _bStartButton() {
    return Positioned(
      bottom: 40,
      right: 30,
      child: MyRoundButton(
        onPressedRelese: SoundPoolSingleton.instance.stopSound,
        height: 74,
        width: 74,
        iconColor: Colors.white,
        gradeintColors: const [
          kcSecondaryStart,
          kcSecondaryStart,
          kcSecondaryEnd
        ],
        onPressed: () => SoundPoolSingleton.instance.playSound().then(
              (_) => Future.delayed(
                const Duration(milliseconds: 800),
                () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (_) => false,
                ),
              ),
            ),
        icon: const Icon(
          Icons.chevron_right_rounded,
          size: 34,
        ),
      ),
    );
  }

  Positioned _bUIStripH(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width,
        child: CustomPaint(
          painter: HorizontalGradientShapePainter(),
        ),
      ),
    );
  }

  Padding _bBottomText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "The Concept i4",
                style: ktHeading2,
              ).animate().slideX(duration: const Duration(milliseconds: 300)),
              const Text(
                "Control The Future",
                style: ktHeading1,
              ).animate().slideX(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                  ),
              const Text(
                "NOW!",
                style: ktHeading3,
              ).animate().slideX(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 200),
                  ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBWMimage() {
    return Visibility.maintain(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          kIi4Slide,
        ),
      ),
    )
        .animate()
        .scaleXY(
          duration: const Duration(milliseconds: 1200),
        )
        .moveX(
          begin: 300,
          end: 0,
          duration: const Duration(milliseconds: 1200),
        );
  }

  Widget _bI4Image() {
    return Image.asset(
      kIi4Name,
    ).animate().slideY(duration: const Duration(milliseconds: 300));
  }

  Widget _bTopText() {
    return RichText(
      text: const TextSpan(
        text: "BMW",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 38,
        ),
        children: [
          TextSpan(
            text: "Concept",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 38,
            ),
          ),
        ],
      ),
    ).animate().slideY(duration: const Duration(milliseconds: 300));
  }
}

class HorizontalGradientShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
        Offset(size.width * 0.01, size.height * 0.50),
        Offset(size.width * 1.01, size.height * 0.50),
        [kcSecondaryStart, kcSecondaryEnd],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0959000, size.height * -0.0016667);
    path_0.quadraticBezierTo(size.width * 0.0089500, size.height * 0.5398167,
        size.width * 0.0640750, size.height * 0.7313667);
    path_0.quadraticBezierTo(size.width * 0.0678000, size.height * 0.8691667,
        size.width * 1.0108000, size.height * 1.0008500);
    path_0.lineTo(size.width * 1.0108000, size.height * 0.7949500);
    path_0.quadraticBezierTo(size.width * 0.2777000, size.height * 0.7578333,
        size.width * 0.1908500, size.height * 0.6657667);
    path_0.quadraticBezierTo(size.width * 0.0748000, size.height * 0.5628167,
        size.width * 0.1317250, size.height * 0.0010333);
    path_0.lineTo(size.width * 0.0959000, size.height * -0.0016667);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
