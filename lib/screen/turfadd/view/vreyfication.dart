import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/screen/turfadd/controller/turf_sign_funtion.dart';
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
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 300,
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/meet-pals.png'),
                  fit: BoxFit.fill,
                ),
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
                    sendOtp(context, value, number);
                  }
                },
              ),
              Container(
                padding: pTRL20,
                child: Text(
                  verifyCode,
                  style: mainTextG,
                ),
              ),
              Cheight20,
            ],
          ),
        )));
  }
}
