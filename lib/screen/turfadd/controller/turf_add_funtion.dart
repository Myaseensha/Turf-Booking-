import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/url.dart';
import '../view/turfprofile_add.dart';
import '../view/vreyfication.dart';

Future<void> sendOTP(
    BuildContext context, String verifyotp, String mobile) async {
  final otpSend = {'otp': verifyotp, 'mobile': mobile};
  final headers = {'Content-Type': 'application/json'};

  final response = await Dio().post(sendotp,
      data: jsonEncode(otpSend), options: Options(headers: headers));

  if (response.statusCode == 200) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => TurfProfileAdd()),
      (route) => false,
    );
  } else if (response.statusCode == 400) {
    const snackBar = SnackBar(content: Text('Invalid Otp Please enter again'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    const snackBar = SnackBar(content: Text('Please check your data'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future<void> signUpInfo(
    BuildContext context, String email, String mobile) async {
  log(mobile);
  log(email);
  final dio = Dio();
  const url = otp;
  final headers = {'Content-Type': 'application/json'};
  final sin = {'email': email, 'mobile': mobile};
  try {
    final response = await dio.post(url,
        data: json.encode(sin), options: Options(headers: headers));
    log("mobile/////////?????????????????///////////");
    if (response.statusCode == 200) {
      // Data sent successfully
      log('Data sent successfully!');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerificationScreen(
                number: mobile,
              )));
    } else if (response.statusCode == 409) {
      // Something went wrong
      log('Error sending data: ${response.statusMessage}');
      var snackBar = const SnackBar(
        content: Text('User already exists'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (error) {
    // Handle any errors that occurred during the request
    log('Error sending data: $error');
    var snackBar = const SnackBar(
      content: Text('Please check your data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future<void> resendOTP(BuildContext context, String mobile) async {
  final otpSend = {'mobile': mobile};
  final headers = {'Content-Type': 'application/json'};

  final response = await Dio().post(resendOtp,
      data: jsonEncode(otpSend), options: Options(headers: headers));

  if (response.statusCode == 200) {
    const snackBar = SnackBar(content: Text('Your OTP code send'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (response.statusCode == 400) {
    const snackBar = SnackBar(content: Text('Invalid Otp Please enter again'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    const snackBar = SnackBar(content: Text('Please check your data'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
