import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf/core/color.dart';
import 'package:turf/screen/onborde_screen/splash_screen.dart';
import 'package:turf/screen/turfadd/controller/image_provider.dart';
import 'package:turf/screen/user/model/booking_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CourtProviderimage(),
        ),
        ChangeNotifierProvider(create: (_) => DateModel()..generateDates()),
        ChangeNotifierProvider(create: (_) => TimeModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: const TextTheme(displayLarge: TextStyle()),
              primarySwatch: Colors.green,
              appBarTheme: AppBarTheme(color: conGreen)),
          home: const SplashScreen()),
    );
  }
}
