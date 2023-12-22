import 'package:bmw_demo/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  //
  final bool value;
  final Function(bool value) onChanged;
  //
  const MySwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool value = false;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 70,
      height: 40,
      decoration: BoxDecoration(
        color: kcBGGrey,
        border: Border.all(color: kcBlack),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            value = !value;
          });
        },
        child: Stack(
          alignment: value ? Alignment.centerLeft : Alignment.centerRight,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 40,
                  height: 40,
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
                      end: value
                          ? Alignment.bottomCenter
                          : Alignment.bottomRight,
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
                        offset: value
                            ? const Offset(0, 0)
                            : const Offset(-1.67, -1.67),
                        blurRadius: value ? 1 : 1.34,
                        spreadRadius: value ? 0.6 : 0.6,
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: !value
                          ? const [
                              kcSecondaryStart,
                              kcSecondaryStart,
                              kcSecondaryEnd
                            ]
                          : const [kcBGGrey, kcBlack],
                      begin: value ? Alignment.topCenter : Alignment.topLeft,
                      end: value
                          ? Alignment.bottomCenter
                          : Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const CircleAvatar(
                    radius: 1,
                    backgroundColor: kcWhite,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
