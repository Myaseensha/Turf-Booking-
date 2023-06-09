import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/url.dart';
import '../view/turfprofile_add.dart';

Future<void> sendOTP(BuildContext context, String verifyotp, String mobile,
    String email, String password, String courtname) async {
  final otpSend = {'otp': verifyotp, 'mobile': mobile};
  final headers = {'Content-Type': 'application/json'};

  final response = await Dio().post(sendotp,
      data: jsonEncode(otpSend), options: Options(headers: headers));

  if (response.statusCode == 200) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => TurfProfileAdd(
                  email: email,
                  mobile: mobile,
                  password: password,
                  courtName: courtname,
                )),
        (route) => false,
      );
    });
  } else if (response.statusCode == 400) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      const snackBar =
          SnackBar(content: Text('Invalid Otp Please enter again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    return;
  } else {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      const snackBar = SnackBar(content: Text('Please check your data'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
