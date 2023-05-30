// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:turf/screen/user/controller/user_add.dart';
import 'package:turf/screen/user/utils/base_url.dart';

Future<void> verifyotp(String mobile, String otp, String password, String name,
    String email, BuildContext context) async {
  final verifyotpbody = {"mobile": mobile, "otp": otp};
  const header = {'Content-Type': 'application/json'};
  final respons = await Dio().post(otpcheckurl,
      data: json.encode(verifyotpbody), options: Options(headers: header));
  if (respons.statusCode == 200) {
    userAdd(context, email, mobile, password, name);
    final responseData = respons.data;
    final message = responseData['message'];
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text("$message"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    final responseData = respons.data;
    final message = responseData['message'];
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Text("$message"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
