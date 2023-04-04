import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/core/color.dart';
import 'package:turf/core/padding.dart';
import 'package:turf/screen/onborde_screen/view/intro_screen.dart';
import 'package:turf/screen/turfadd/view/profile_page.dart';
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
    turfcheckToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conWhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: pR30,
              child: RichText(
                text: const TextSpan(
                  text: "Let'",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                        text: " S ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 55,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: 'Play',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 60,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            Center(child: Lottie.asset('assets/Lottie/61182-ball-sport.json')),
          ],
        ),
      ),
    );
  }

  Future<void> goToGetPage() async {
    await Future.delayed(const Duration(seconds: 8));
    if (!mounted) {
      return;
    }
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const IntroScreen()));
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      goToGetPage();
    } else {
      await Future.delayed(const Duration(seconds: 8));
      if (!mounted) {
        log(token);
        return;
      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const TurfProfileSceen()));
    }
  }

  Future<void> turfcheckToken() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('Turftoken');
    if (token == null) {
      goToGetPage();
    } else {
      await Future.delayed(const Duration(seconds: 8));
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const TurfProfile()));
    }
  }
}
