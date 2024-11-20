import 'package:flutter/material.dart';
import 'package:zeroplace/common/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'roboto'),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
