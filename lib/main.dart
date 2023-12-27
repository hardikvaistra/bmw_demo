import 'package:bmw_demo/screens/start_screen.dart';
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
          primary: kcPrimary,
          secondary: kcSecondaryEnd,
          tertiary: kcSecondaryStart,
        ),
        scaffoldBackgroundColor: kcBG,
      ),
      home: const StartPage(),
    );
  }
}
