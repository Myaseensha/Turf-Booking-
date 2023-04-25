import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:turf/screen/user/utils/base_url.dart';
import 'package:turf/screen/user/view/turf_list_screen.dart';

Future<void> userAdd(BuildContext context, String email, String mobile,
    String password, String username) async {
  final dio = Dio();
  final usersendbody = {
    "email": email,
    "mobile": mobile,
    "username": username,
    "password": password
  };
  const hearder = {'Content-Type': 'application/json'};
  try {
    final resp = await dio.post(useradd,
        data: jsonEncode(usersendbody), options: Options(headers: hearder));
    if (resp.statusCode == 201) {
      log("data send");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const TurfProfileSceen(),
          ),
          (route) => false);
    } else if (resp.statusCode == 500) {
      const snackBar = SnackBar(
        content: Text('Internal Server Error !'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (error) {
    log(error.toString());
    const snackBar = SnackBar(
      content: Text('Please check your data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
