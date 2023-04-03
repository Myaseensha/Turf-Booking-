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
  } else {
    const snackBar = SnackBar(
      content: Text('Internal Server Error !'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
