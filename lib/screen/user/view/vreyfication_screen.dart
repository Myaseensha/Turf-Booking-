import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/screen/user/view/turf_profile_screen.dart';
import 'package:turf/widget/otp.dart';

import '../../../core/color.dart';
import '../../../core/padding.dart';

class VerificationScreenUser extends StatelessWidget {
  VerificationScreenUser({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cblack,
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
              Container(
                padding: pTRL20,
                child: Text(
                  verifyCode,
                  style: mainTextG,
                ),
              ),
              Cheight20,
              Cheight20,
              Pinput(
                controller: otpController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
              ),
              Padding(
                padding: pTRL20,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TurfProfileSceen(),
                          ));
                    },
                    style: signup,
                    child: Text(verify, style: shortTextW),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
