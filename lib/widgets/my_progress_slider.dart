import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

class MyLinearProgressBar extends StatefulWidget {
  const MyLinearProgressBar({
    super.key,
    required this.currentSize,
    required this.totalSize,
  });

  final int currentSize;
  final int totalSize;

  @override
  State<MyLinearProgressBar> createState() => _MyLinearProgressBarState();
}

class _MyLinearProgressBarState extends State<MyLinearProgressBar> {
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
          Positioned(
            left: ((currentSize / widget.totalSize) *
                    MediaQuery.of(context).size.width) +
                getExtraSpace(),
            child: _RoundEmbosedCircle(currentSize: currentSize),
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

class _RoundEmbosedCircle extends StatelessWidget {
  const _RoundEmbosedCircle({
    super.key,
    required this.currentSize,
  });

  final int currentSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
