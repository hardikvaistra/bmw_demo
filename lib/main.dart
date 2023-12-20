import 'package:bmw_demo/constants/my_images.dart';
import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:flutter/material.dart';

import 'constants/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMW Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Colors.red,
          secondary: Colors.yellow,
          tertiary: Colors.blue,
        ),
        scaffoldBackgroundColor: kcBG,
      ),
      home: const MyHomePage(title: 'First Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BackgroundContainer(
        child: Stack(
          children: [
            Positioned(
              left: 10,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: 60,
                child: CustomPaint(
                  painter: VerticleGradientShapePainter(),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.58,
              right: 0,
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.81,
                child: CustomPaint(
                  painter: HorizontalGradientShapePainter(),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
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
                ),
                Image.asset(
                  kIi4Name,
                ),
                const SizedBox(
                  height: 30,
                ),
                Visibility.maintain(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      kIi4Slide,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "The Concept i4",
                            style: ktHeading2,
                          ),
                          Text(
                            "Control The Future",
                            style: ktHeading1,
                          ),
                          Text(
                            "NOW!",
                            style: ktHeading3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              right: 30,
              child: MyRoundButton(
                onPressed: () {},
                icon: Icons.chevron_right_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyRoundButton extends StatefulWidget {
  const MyRoundButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function() onPressed;
  final IconData icon;

  @override
  State<MyRoundButton> createState() => _MyRoundButtonState();
}

class _MyRoundButtonState extends State<MyRoundButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (details) => setState(() => isPressed = true),
      onTapCancel: () => setState(() => isPressed = false),
      onTapUp: (details) => setState(() => isPressed = false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  kcSecondaryEnd,
                  kcSecondaryStart,
                  kcSecondaryStart,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: isPressed
                  ? []
                  : [
                      const BoxShadow(
                        color: Colors.black,
                        offset: Offset(4.67, 4.67),
                        blurRadius: 65.34,
                        spreadRadius: 0.6,
                      ),
                      const BoxShadow(
                        color: Colors.white60,
                        offset: Offset(-4.67, -4.67),
                        blurRadius: 64.34,
                        spreadRadius: 0.1,
                      ),
                      const BoxShadow(
                        color: Colors.black,
                        offset: Offset(4.67, 4.67),
                        blurRadius: 5.34,
                        spreadRadius: 0.6,
                      ),
                    ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [kcSecondaryStart, kcSecondaryStart, kcSecondaryEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(
              widget.icon,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class VerticleGradientShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    var rect = Offset.zero & size;

    paint.shader = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        kcSecondaryStart,
        kcSecondaryEnd,
      ],
    ).createShader(rect);
    final path = Path();
    path.lineTo(10, 0);
    path.lineTo(size.width + 30, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HorizontalGradientShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    var rect = Offset.zero & size;

    paint.shader = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        kcSecondaryEnd,
        kcSecondaryStart,
      ],
    ).createShader(rect);
    final path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height + 40);
    path.lineTo(0, size.height - 20);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kcBGGrey, kcBGGrey, kcTransparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
