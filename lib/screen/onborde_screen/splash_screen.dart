import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/core/color.dart';
import 'package:turf/screen/onborde_screen/view/intro_screen.dart';
import 'package:turf/screen/user/view/turf_profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conBlack,
      body: const SafeArea(
        child: Center(
          child: Text('data'),
        ),
      ),
    );
  }

  Future<void> goToGetPage() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) {
      return;
    }
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const IntroScreen()));
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token!.isEmpty) {
      goToGetPage();
    } else {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const TurfProfileSceen()));
    }
  }
}
