import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:turf/screen/user/utils/base_url.dart';
import 'package:turf/screen/user/view/vreyfication_screen.dart';

Future<void> usersentotp(String password, String username, String email,
    String mobile, BuildContext context) async {
  final header = {'Content-Type': 'application/json'};
  final usreotp = {"email": email, "mobile": mobile};
  try {
    final respons = await Dio().post(otpurl,
        data: json.encode(usreotp), options: Options(headers: header));
    if (respons.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            VerificationScreenUser(email, mobile, username, password),
      ));
    } else if (respons.statusCode == 409) {
      const snackBar = SnackBar(
        content: Text('User already exists'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (error) {
    log(error.toString());
    const snackBar = SnackBar(
      content: Text('Please check your mobile data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
