import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/screen/turfadd/controller/turf_add_funtion.dart';
import 'package:turf/screen/turfadd/view/turf_signup_screen.dart';

import '../../../core/color.dart';
import '../../../core/padding.dart';
import '../../../widget/otp.dart';

class VerificationScreen extends StatelessWidget {
  final String number;
  const VerificationScreen({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.45,
              child: Lottie.asset(
                  "assets/Lottie/105173-verification-code-otp.json"),
            ),
            Cheight20,
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              onCompleted: (value) {
                {
                  log(number);
                  log('message/////////////////////////');
                  sendOTP(context, value, number);
                }
              },
            ),
            Cheight20,
            Center(
              child: Text(
                otpText,
                style: minTextG,
              ),
            ),
            Cheight20,
            Center(
              child: Container(
                padding: pRL30,
                child: Text(
                  textAlign: TextAlign.center,
                  otpCommend,
                  style: shortTextBS,
                ),
              ),
            ),
            Cheight20,
            Text(
              dont,
              style: shortTextBlack,
            ),
            Cheight10,
            GestureDetector(
                onTap: () {
                  resendOTP(context, number);
                },
                child: Text(
                  resendCode,
                  style: minTextG,
                )),
          ],
        ))));
  }
}
