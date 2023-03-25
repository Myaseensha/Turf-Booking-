import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/url.dart';
import '../view/turfprofile_add.dart';
import '../view/vreyfication.dart';

Future<void> signUpInfo(
    BuildContext context, String email, String mobile, String password) async {
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
                email: email,
                password: password,
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
