import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

class MyRoundButton extends StatefulWidget {
  const MyRoundButton({
    super.key,
    required this.onPressed,
    this.onPressedRelese,
    this.icon,
    this.image,
    this.gradeintColors,
    this.height = 54,
    this.width = 54,
    this.iconColor,
  });

  final void Function() onPressed;
  final double height;
  final double width;
  final void Function()? onPressedRelese;
  final IconData? icon;
  final Color? iconColor;
  final Image? image;
  final List<Color>? gradeintColors;

  @override
  State<MyRoundButton> createState() => _MyRoundButtonState();
}

class _MyRoundButtonState extends State<MyRoundButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (details) => [setState(() => isPressed = true)],
      onTapCancel: () {
        setState(() => isPressed = false);
        if (widget.onPressedRelese != null) widget.onPressedRelese!();
      },
      onTapUp: (details) {
        setState(() => isPressed = false);
        if (widget.onPressedRelese != null) widget.onPressedRelese!();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.height,
            height: widget.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: widget.gradeintColors?.reversed.toList() ??
                    const [kcBlack, kcBGGrey],
                begin: isPressed ? Alignment.topCenter : Alignment.topLeft,
                end: isPressed ? Alignment.bottomCenter : Alignment.bottomRight,
              ),
              boxShadow: [
                const BoxShadow(
                  color: Colors.white10,
                  offset: Offset(-4.67, 0),
                  blurRadius: 6.34,
                  spreadRadius: 0.4,
                ),
                BoxShadow(
                  color: isPressed ? Colors.black : Colors.white30,
                  offset: isPressed
                      ? const Offset(0, 0)
                      : const Offset(-4.67, -4.67),
                  blurRadius: isPressed ? 4 : 30.34,
                  spreadRadius: isPressed ? 4 : 0.6,
                ),
                const BoxShadow(
                  color: Colors.black38,
                  offset: Offset(4.67, 4.67),
                  blurRadius: 5.34,
                  spreadRadius: 0.6,
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.height - 6,
            height: widget.width - 6,
            padding: EdgeInsets.all(widget.width * 0.2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: widget.gradeintColors ?? const [kcBGGrey, kcBlack],
                begin: isPressed ? Alignment.topCenter : Alignment.topLeft,
                end: isPressed ? Alignment.bottomCenter : Alignment.bottomRight,
              ),
            ),
            child: _buildChild(),
          ),
        ],
      ),
    );
  }

  Widget _buildChild() {
    if (widget.image != null) {
      return widget.image!;
    }
    if (widget.icon != null) {
      return Icon(
        widget.icon,
        size: 24,
        color: widget.iconColor ?? Colors.grey,
      );
    }
    return Container();
  }
}
