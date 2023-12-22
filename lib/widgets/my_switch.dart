import 'package:bmw_demo/constants/my_colors.dart';
import 'package:bmw_demo/widgets/round_embosed_circle.dart';
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
            RoundEmbosedCircle(value: value),
          ],
        ),
      ),
    );
  }
}
