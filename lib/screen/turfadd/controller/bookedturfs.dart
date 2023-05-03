import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:turf/screen/user/utils/base_url.dart';

Future<void> bookedTurfs(
    String token, BuildContext context, dynamic req) async {
  const url = '$baseurl/turf-booked-details';
  try {
    final response = await Dio().get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      queryParameters: {'id': req.user.id},
    );
    if (response.statusCode == 200) {
      final responseData = response.data;
      // Do something with the responseData
      print(responseData);
    } else {
      final responseData = response.data;
      final message = responseData['message'];
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('$message'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (error) {
    print('Error getting booked turfs: $error');
  }
}
