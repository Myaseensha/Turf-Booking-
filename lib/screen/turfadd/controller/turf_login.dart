import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/screen/turfadd/utils/url.dart';
import '../view/profile_page.dart';

Future<void> turflogin(
    String email, String password, BuildContext context) async {
  final headers = {'Content-Type': 'application/json'};
  final turfloginbody = {"email": email, "password": password};
  final response = await Dio().post(courtloginurl,
      data: json.encode(turfloginbody), options: Options(headers: headers));
  try {
    if (response.statusCode == 200) {
      final token = response.data['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('Turftoken', token);
      log(
          "${response.data}///////////////////////////////////////////////////////////////////\\\\\\");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const TurfProfile(),
          ),
          (route) => false);
    } else {
      log(response.statusMessage.toString());
    }
  } catch (e) {
    log(e.toString());

    const snackBar = SnackBar(
      content: Text('Please check your mobile data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
