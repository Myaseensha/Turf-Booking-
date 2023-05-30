// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/url.dart';

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
