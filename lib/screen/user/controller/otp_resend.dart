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
    final responseData = response.data;
    final message = responseData['message'];
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text("$message"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    final responseData = response.data;
    final message = responseData['message'];
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Text("$message"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
