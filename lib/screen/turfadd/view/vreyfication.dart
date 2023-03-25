import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';

import '../../../core/color.dart';
import '../../../core/padding.dart';
import '../../../widget/otp.dart';
import '../controller/turf_resend_otp.dart';
import '../controller/turf_verify.dart';

class VerificationScreen extends StatelessWidget {
  final String number;
  final String email;
  final String password;
  final String courtname;
  const VerificationScreen(
      {super.key,
      required this.number,
      required this.email,
      required this.password,
      required this.courtname});

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
            conHeight20,
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              onCompleted: (value) {
                {
                  log(number);
                  log('message/////////////////////////');
                  sendOTP(context, value, number, email, password, courtname);
                }
              },
            ),
            conHeight20,
            Center(
              child: Text(
                otpText,
                style: minTextG,
              ),
            ),
            conHeight20,
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
            conHeight20,
            Text(
              dont,
              style: shortTextBlack,
            ),
            conHeight10,
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
