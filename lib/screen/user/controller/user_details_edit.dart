import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/screen/user/utils/base_url.dart';

Future<void> updateProfile(
  String username,
  String email,
  String mobile,
  BuildContext context,
) async {
  try {
    const url = '$baseurl/profile/update';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final dio = Dio();
    final response = await dio.put(
      url,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {'username': username, 'email': email, 'mobile': mobile},
    );

    if (response.statusCode == 200) {
      final responseData = response.data;
      final message = responseData['message'];
      Navigator.pop(context);
      print(message);
    } else {
      final responseData = response.data;
      final message = responseData['message'];
      print(message);
      throw Exception('Failed to update profile');
    }
  } catch (error) {
    print(error.toString());
    throw Exception('Failed to update profile');
  }
}
