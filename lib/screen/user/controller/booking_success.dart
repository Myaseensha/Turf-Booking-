import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf/screen/user/utils/base_url.dart';

Future bookingSuccess(
  String userToken,
  String bookingId,
  BuildContext context,
) async {
  bool result = false;
  const url = "$baseurl/book/booking-success";
  final body = {"id": bookingId};
  try {
    final response = await Dio().patch(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      ),
      data: json.encode(body),
    );
    if (response.statusCode == 200) {
      final responseData = response.data;
      final message = responseData['message'];
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("$message"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Booking success');
      print(response.data);
      result = true;
      return result;
    } else {
      final responseData = response.data;
      final message = responseData['message'];
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("$message"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } catch (error) {
    print('Error updating booking status: $error');
  }
}
