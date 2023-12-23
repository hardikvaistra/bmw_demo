import 'dart:math'as math ;

import 'package:bmw_demo/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyNewPolygonButton extends StatefulWidget {
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
  State<MyNewPolygonButton> createState() => _MyNewPolygonButtonState();
}

class _MyNewPolygonButtonState extends State<MyNewPolygonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animationController
            .forward()
            .then((value) => animationController.reset());
      },
      child: Animate(
        controller: animationController,
        autoPlay: false,
        effects: const [
          ShimmerEffect(duration: Duration(milliseconds: 300), angle: 1),
        ],
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle:
                  widget.sides == 3 ? -math.pi / (widget.isLeft ? 2 : 6) : -math.pi / 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 160,
                    width: 160,
                    decoration: ShapeDecoration(
                      shape: StarBorder.polygon(
                          sides: widget.sides, pointRounding: 0.3),
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
                          color:
                              widget.isLeft ? Colors.black38 : Colors.white30,
                          offset: const Offset(-2.67, -2.67),
                          blurRadius: 10.34,
                          spreadRadius: 0.6,
                        ),
                        BoxShadow(
                          color:
                              widget.isLeft ? Colors.white30 : Colors.black38,
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
                      shape: StarBorder.polygon(
                          sides: widget.sides, pointRounding: 0.26),
                      color: kcBGDark,
                    ),
                    child: Container(),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(
                  widget.isLeft
                      ? 15
                      : widget.sides == 3
                          ? -10
                          : -25,
                  0),
              child: Icon(
                widget.icon,
                color: kcSecondaryEnd,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
