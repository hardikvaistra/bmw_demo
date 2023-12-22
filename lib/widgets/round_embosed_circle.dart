import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

class RoundEmbosedCircle extends StatelessWidget {
  const RoundEmbosedCircle({
    super.key,
    this.value = true,
    this.size = 40,
  });

  final double size;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: !value
                  ? const [
                      kcSecondaryEnd,
                      kcSecondaryStart,
                      kcSecondaryStart,
                    ]
                  : const [kcBlack, kcBGGrey],
              begin: value ? Alignment.topCenter : Alignment.topLeft,
              end: value ? Alignment.bottomCenter : Alignment.bottomRight,
            ),
            boxShadow: [
              const BoxShadow(
                color: Colors.white10,
                offset: Offset(4.67, 0),
                blurRadius: 6.34,
                spreadRadius: 0.4,
              ),
              BoxShadow(
                color: value ? Colors.black : Colors.white30,
                offset: value ? const Offset(0, 0) : const Offset(-1.67, -1.67),
                blurRadius: value ? 1 : 1.34,
                spreadRadius: value ? 0.6 : 0.6,
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: size - 10,
          height: size - 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: !value
                  ? const [kcSecondaryStart, kcSecondaryStart, kcSecondaryEnd]
                  : const [kcBGGrey, kcBlack],
              begin: value ? Alignment.topCenter : Alignment.topLeft,
              end: value ? Alignment.bottomCenter : Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 3,
                backgroundColor: kcWhite,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
