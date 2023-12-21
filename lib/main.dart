import 'package:bmw_demo/screens/start_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soundpool/soundpool.dart';

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
      home: const SoundpoolInitializer(),
    );
  }
}

class SoundpoolInitializer extends StatefulWidget {
  const SoundpoolInitializer({super.key});

  @override
  State createState() => _SoundpoolInitializerState();
}

class _SoundpoolInitializerState extends State<SoundpoolInitializer> {
  Soundpool? _pool;
  SoundpoolOptions _soundpoolOptions = const SoundpoolOptions();

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) _initPool(_soundpoolOptions);
  }

  @override
  Widget build(BuildContext context) {
    if (_pool == null) {
      return Material(
        child: Center(
          child: (kIsWeb)
              ? TextButton(
                  child: const Text("Start"),
                  onPressed: () {
                    _initPool(_soundpoolOptions);
                  },
                )
              : const CircularProgressIndicator(),
        ),
      );
    } else {
      return StartPage(
        pool: _pool!,
        onOptionsChange: _initPool,
      );
    }
  }

  void _initPool(SoundpoolOptions soundpoolOptions) {
    _pool?.dispose();
    setState(() {
      _soundpoolOptions = soundpoolOptions;
      _pool = Soundpool.fromOptions(options: _soundpoolOptions);
    });
  }
}
