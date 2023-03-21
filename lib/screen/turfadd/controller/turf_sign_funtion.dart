import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/model/otpverify.dart';
import '../../../utils/url.dart';
import '../model/signup.dart';
import '../view/turfprofile_add.dart';
import '../view/vreyfication.dart';

Future singupOtpGet(BuildContext context, String email, String mobile) async {
  Signup signup = Signup(email: email, mobile: mobile);
  try {
    final resp = await http.post(
        Uri.parse(
          otp,
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signup.toJson()));

    if (resp.statusCode == 200) {
      log(resp.body);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerificationScreen(
                number: mobile,
              )));
    } else if (resp.statusCode == 409) {
      var snackBar = const SnackBar(
        content: Text('User already exists'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (e) {
    var snackBar = const SnackBar(
      content: Text('Please check your data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future sendOtp(BuildContext context, String verifyotp, String mobile) async {
  OtpSend otpSend = OtpSend(otp: verifyotp, mobile: mobile);
  log(verifyotp);
  log(mobile);
  try {
    final response = await http.post(
        Uri.parse(
          sendotp,
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(otpSend.toJson()));

    if (response.statusCode == 200) {
      log(response.body);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => TurfProfileAdd(),
          ),
          (route) => false);
    } else if (response.statusCode == 400) {
      var snackBar = const SnackBar(
        content: Text('Invalid Otp Please enter agine'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (e) {
    var snackBar = const SnackBar(
      content: Text('Please check your data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

String numbersave(String number) {
  final mobile = number;
  return mobile;
}
