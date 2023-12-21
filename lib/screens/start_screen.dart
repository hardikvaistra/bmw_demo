import 'package:bmw_demo/constants/my_textstyle.dart';
import 'package:bmw_demo/screens/home_screen.dart';
import 'package:bmw_demo/widgets/background_container.dart';
import 'package:bmw_demo/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

import '../constants/my_colors.dart';
import '../constants/my_images.dart';

class StartPage extends StatefulWidget {
  final Soundpool pool;
  final ValueSetter<SoundpoolOptions> onOptionsChange;
  const StartPage(
      {super.key, required this.pool, required this.onOptionsChange});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late Soundpool pool;

  int? _alarmSoundStreamId;
  late Future<int> _soundId;

  Soundpool get _soundpool => widget.pool;

  @override
  void initState() {
    super.initState();
    _loadSounds();
  }

  @override
  void didUpdateWidget(StartPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pool != widget.pool) {
      _loadSounds();
    }
  }

  void _loadSounds() {
    _soundId = _loadSound();
  }

  Future<int> _loadSound() async {
    var asset = await rootBundle.load("assets/sounds/bmw.mp3");
    return await _soundpool.load(asset);
  }

  Future<void> _playSound() async {
    var alarmSound = await _soundId;
    _alarmSoundStreamId = await _soundpool.play(alarmSound);
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<void> _stopSound() async {
    if (_alarmSoundStreamId != null) {
      await _soundpool.stop(_alarmSoundStreamId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BackgroundContainer(
        child: Stack(
          children: [
            // SmokeEffect(),
            _bUIStripV(context),
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
        onPressedRelese: _stopSound,
        height: 74,
        width: 74,
        gradeintColors: const [
          kcSecondaryStart,
          kcSecondaryStart,
          kcSecondaryEnd
        ],
        onPressed: () => _playSound().then(
          (value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          ),
        ),
        icon: Icons.chevron_right_rounded,
      ),
    );
  }

  Positioned _bUIStripV(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.05,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: 60,
        child: CustomPaint(
          painter: VerticleGradientShapePainter(),
        ),
      ),
    );
  }

  Positioned _bUIStripH(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.58,
      right: 0,
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.81,
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
    );
  }

  Visibility _buildBWMimage() {
    return Visibility.maintain(
      visible: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          kIi4Slide,
        ),
      ),
    );
  }

  Image _bI4Image() {
    return Image.asset(
      kIi4Name,
    );
  }

  RichText _bTopText() {
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
