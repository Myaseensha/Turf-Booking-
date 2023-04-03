import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf/screen/user/utils/base_url.dart';

Future<void> resendotp(String mobile, BuildContext context) async {
  final otpbody = {"mobile": mobile};
  const header = {'Content-Type': 'application/json'};
  final response = await Dio().post(resendotpurl,
      data: json.encode(otpbody), options: Options(headers: header));
  if (response.statusCode == 200) {
    const snackBar = SnackBar(
      content: Text('OTP sended in your mobile number'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    const snackBar = SnackBar(
      content: Text('Internal Server Error !'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
