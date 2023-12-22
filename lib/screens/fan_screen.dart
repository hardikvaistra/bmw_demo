import 'package:bmw_demo/constants/my_colors.dart';
import 'package:bmw_demo/constants/my_font_icons.dart';
import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:bmw_demo/widgets/background_container.dart';
import 'package:bmw_demo/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../widgets/my_switch.dart';
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
              CustomPaint(
                size: const Size(300, 160),
                painter: PoligonPainter(),
                child: SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                      const SizedBox(width: 60),
                      const Icon(
                        MyFontIcons.fan,
                        size: 36,
                        color: kcSecondaryEnd,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Climate", style: ktBody),
                            SizedBox(height: 5),
                            Text("Current 26°C", style: ktLabel),
                          ],
                        ),
                      ),
                      MySwitch(value: true, onChanged: (value) {}),
                      const SizedBox(width: 60)
                    ],
                  ),
                ),
              ),
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

class PoligonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill1 = Paint()
      ..color = const Color.fromARGB(255, 29, 29, 29)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill1.shader = ui.Gradient.linear(
        Offset(size.width * 0.03, size.height * 0.49),
        Offset(size.width * 0.97, size.height * 0.49),
        [const Color(0xff201d1d), const Color(0xff2a2a2a)],
        [0.00, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0677333, size.height * 0.0373571);
    path_1.quadraticBezierTo(size.width * 0.0352333, size.height * 0.0343286,
        size.width * 0.0252750, size.height * 0.0922857);
    path_1.lineTo(size.width * 0.0641333, size.height * 0.9025429);
    path_1.quadraticBezierTo(size.width * 0.0869500, size.height * 0.9539857,
        size.width * 0.1074500, size.height * 0.9504143);
    path_1.cubicTo(
        size.width * 0.2037000,
        size.height * 0.9307714,
        size.width * 0.8377500,
        size.height * 0.7853571,
        size.width * 0.9340000,
        size.height * 0.7657143);
    path_1.quadraticBezierTo(size.width * 0.9521667, size.height * 0.7625000,
        size.width * 0.9575000, size.height * 0.7128571);
    path_1.lineTo(size.width * 0.9733333, size.height * 0.2650000);
    path_1.quadraticBezierTo(size.width * 0.9707917, size.height * 0.2347143,
        size.width * 0.9500000, size.height * 0.2257143);
    path_1.cubicTo(
        size.width * 0.8518750,
        size.height * 0.2148286,
        size.width * 0.3596083,
        size.height * 0.0857571,
        size.width * 0.0677333,
        size.height * 0.0373571);
    path_1.close();

    // Pentagon Shadow
    canvas.drawShadow(path_1, Colors.white60, 5.0, false);

    // Pentagon
    canvas.drawPath(path_1, paintFill1);

    Paint paintStroke1 = Paint()
      ..color = const Color.fromARGB(255, 46, 41, 41)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintStroke1.shader = ui.Gradient.linear(
        Offset(size.width * 0.03, size.height * 0.49),
        Offset(size.width * 0.97, size.height * 0.49),
        [const Color(0xff373737), const Color(0xff646464)],
        [0.00, 1.00]);

    // Pentagon Border
    canvas.drawPath(path_1, paintStroke1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
