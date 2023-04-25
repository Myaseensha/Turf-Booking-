import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/screen/user/utils/base_url.dart';
import 'package:turf/screen/user/view/turf_list_screen.dart';

Future<void> userlogi(
    String password, String email, BuildContext context) async {
  const header = {'Content-Type': 'application/json'};
  final loginbody = {"email": email, "password": password};
  final respons = await Dio().post(loginurl,
      data: json.encode(loginbody), options: Options(headers: header));
  if (respons.statusCode == 200) {
    final token = respons.data['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const TurfProfileSceen(),
        ),
        (route) => false);
  } else {
    const snackBar = SnackBar(
      content: Text('Internal Server Error !'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
