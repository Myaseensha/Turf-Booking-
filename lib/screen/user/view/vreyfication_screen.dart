import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:turf/core/h_w.dart';
import 'package:turf/core/hard_text.dart';
import 'package:turf/screen/user/controller/otp_check.dart';
import 'package:turf/screen/user/controller/otp_resend.dart';
import 'package:turf/widget/otp.dart';

import '../../../core/color.dart';
import '../../../core/padding.dart';

class VerificationScreenUser extends StatelessWidget {
  const VerificationScreenUser(
      this.email, this.mobile, this.name, this.password,
      {super.key});
  final String email;
  final String mobile;
  final String password;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: conBlack,
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
              conHeight20,
              conHeight20,
              Pinput(
                defaultPinTheme: defaultPinThemeGreen,
                focusedPinTheme: focusedPinThemeGreen,
                submittedPinTheme: submittedPinThemeGreen,
                onCompleted: (value) {
                  verifyotp(mobile, value, password, name, email, context);
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
                    resendotp(mobile, context);
                  },
                  child: Text(
                    resendCode,
                    style: minTextG,
                  )),
            ],
          ),
        )));
  }
}
