import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/core/color.dart';
import 'package:turf/screen/onborde_screen/view/intro_screen.dart';

import 'package:turf/screen/user/view/turf_list_screen.dart';

import '../turfadd/view/profile_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conWhite,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/image/timothy-tan-PAe2UhGo-S4-unsplash.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/image/football.png',
                        height: 80.0,
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Let\'s Play',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Find and book sports facilities with ease!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: conGreen,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 40.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                          checkToken();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Get Started',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: conGreen,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Icon(Icons.arrow_forward, color: conGreen),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      turfcheckToken();
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
    log(token.toString());
    if (token == null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const IntroScreen()));
    } else {
      await Future.delayed(const Duration(seconds: 8));
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => TurfProfile(
                token: token,
              )));
    }
  }
}
