import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/url.dart';

import '../view/vreyfication.dart';

Future<void> signUpInfo(BuildContext context, String email, String mobile,
    String password, String courtName) async {
  final dio = Dio();
  const url = otp;
  final headers = {'Content-Type': 'application/json'};
  final sin = {'email': email, 'mobile': mobile};
  try {
    final response = await dio.post(url,
        data: json.encode(sin), options: Options(headers: headers));
    if (response.statusCode == 200) {
      log("Data sent successfull");

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerificationScreen(
                number: mobile,
                email: email,
                password: password,
                courtname: courtName,
              )));
      ;
    } else if (response.statusCode == 409) {
      // Something went wrong
      WidgetsBinding.instance.addPostFrameCallback((_) {
        const snackBar = SnackBar(
          content: Text('User already exists'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  } catch (error) {
    // Handle any errors that occurred during the request
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const snackBar = SnackBar(
        content: Text('Please check your data'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
