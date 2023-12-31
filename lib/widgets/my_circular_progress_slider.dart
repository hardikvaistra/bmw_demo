import 'dart:math';

import 'package:bmw_demo/constants/my_colors.dart';
import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:bmw_demo/widgets/round_embosed_circle.dart';
import 'package:flutter/material.dart';

import '../utils/circular_arc_calculations.dart';

double radius = 135;
double strokeWidth = 30;

class MyCircularProgressSlider extends StatefulWidget {
  final Size size;
  final Function(int)? onValueChange;
  final String label;
  const MyCircularProgressSlider({
    super.key,
    this.size = const Size(300, 300),
    required this.label,
    this.onValueChange,
  });

  @override
  State<MyCircularProgressSlider> createState() =>
      _MyCircularProgressSliderState();
}

class _MyCircularProgressSliderState extends State<MyCircularProgressSlider> {
  int volume = 0;

  @override
  void initState() {
    // volume = ((10 / (pi * 2)) * 100).toInt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _backCircle(),
        _middleCircle(),
        _topCircle(),
      ],
    );
  }

  Container _backCircle() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [kcBGDark, kcBGGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.white10,
            offset: Offset(-4.67, 0),
            blurRadius: 6.34,
            spreadRadius: 0.4,
          ),
          BoxShadow(
            color: Colors.white30,
            offset: Offset(-4.67, -4.67),
            blurRadius: 20.34,
            spreadRadius: 0.6,
          ),
          BoxShadow(
            color: Colors.black38,
            offset: Offset(4.67, 4.67),
            blurRadius: 5.34,
            spreadRadius: 0.6,
          ),
        ],
        border: Border.all(color: kcBGGrey, width: 1),
      ),
      height: widget.size.height,
      width: widget.size.height,
    );
  }

  Widget _middleCircle() {
    return ProgressArc(
      onAngleChanged: (value) {
        volume = ((value / (pi * 2)) * 100).toInt();
        setState(() {});
      },
    );
  }

  Container _topCircle() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kcBGDark,
        border: Border.all(color: kcBGGrey, width: 3),
      ),
      height: widget.size.height * 0.5,
      width: widget.size.height * 0.5,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${volume + 1}%",
            style: ktHeading1.copyWith(fontSize: 42),
          ),
          const Text("Volume", style: ktLabel),
        ],
      ),
    );
  }
}

class ProgressArc extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;
  const ProgressArc({
    super.key,
    required this.onAngleChanged,
  });

  @override
  State<ProgressArc> createState() => _ProgressArcState();
}

class _ProgressArcState extends State<ProgressArc> {
  double startAngle = toRadian(90);

  double totalAngle = toRadian(360);

  Offset _currentDragOffset = Offset.zero;

  double currentAngle = 0.03;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size / 1.2;
    Size canvasSize = Size(screenSize.width * 0.9, screenSize.width * 0.9);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(
      center - Offset(strokeWidth * 0.9, strokeWidth * 1.5),
      currentAngle + startAngle,
      radius - 30,
    );

    return Stack(
      children: [
        CustomPaint(
          size: canvasSize,
          painter: ArcPaint(startAngle: startAngle, currentAngle: currentAngle),
        ),
        Positioned(
          left: knobPos.dx,
          top: knobPos.dy + 20,
          child: GestureDetector(
            onPanStart: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              _currentDragOffset = getBox.globalToLocal(details.globalPosition);
            },
            onPanUpdate: (details) {
              var previousOffset = _currentDragOffset;
              _currentDragOffset += details.delta;
              var angle = currentAngle +
                  toAngle(_currentDragOffset, center) -
                  toAngle(previousOffset, center);
              currentAngle = normalizeAngle(angle);
              widget.onAngleChanged(currentAngle);
              setState(() {});
            },
            child: const RoundEmbosedCircle(
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}

class ArcPaint extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  ArcPaint({required this.startAngle, required this.currentAngle});
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius - 33);

    final paint = Paint()
      ..shader = const SweepGradient(
        colors: [
          kcSecondaryStart,
          kcSecondaryEnd,
          kcSecondaryStart,
        ],
        transform: GradientRotation(1.55),
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 30
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, 5, paint);
    // paint.shader = const SweepGradient(
    //   colors: [
    //     kcSecondaryStart,
    //     kcSecondaryEnd,
    //   ],
    //   startAngle: 1,
    // ).createShader(rect);

    canvas.drawArc(rect, startAngle, currentAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
