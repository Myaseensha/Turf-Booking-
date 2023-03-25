import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';
import 'package:turf/screen/onborde_screen/view/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(displayLarge: TextStyle()),
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(color: conGreen)),
      home: const LoginScreen(),
    );
  }
}
