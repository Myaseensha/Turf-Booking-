import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utils/url.dart';
import '../view/vreyfication.dart';

Future<void> signupinfo(BuildContext context, String email, String mobile,
    String password, String courtName) async {
  log("Data enterd successfull in this function");
  final dio = Dio();
  final headers = {'Content-Type': 'application/json'};
  final signbody = {'email': email, 'mobile': mobile};
  try {
    final response = await dio.post(otp,
        data: json.encode(signbody), options: Options(headers: headers));
    if (response.statusCode == 200) {
      log("Data sent successfull");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerificationScreen(
                number: mobile,
                email: email,
                password: password,
                courtname: courtName,
              )));
    } else if (response.statusCode == 409) {
      const snackBar = SnackBar(
        content: Text('User already exists'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (error) {
    // Handle any errors that occurred during the request
    log(error.toString());
    const snackBar = SnackBar(
      content: Text('Please check your data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
