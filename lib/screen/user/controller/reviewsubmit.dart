import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:turf/screen/user/utils/base_url.dart';

Future<void> reviewSubmit(
    String token, dynamic body, dynamic req, BuildContext context) async {
  const url = '$baseurl/review-submit';
  try {
    final response = await Dio().post(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: json.encode({...body, 'user': req['user']['id']}),
    );
    if (response.statusCode == 200) {
      final responseData = response.data;
      final message = responseData['message'];
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('$message'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Review submitted successfully');
      print(response.data);
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
    print('Error submitting review: $error');
  }
}
