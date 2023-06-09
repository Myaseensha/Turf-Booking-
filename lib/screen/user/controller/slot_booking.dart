import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:turf/screen/user/utils/base_url.dart';

Future<bool> bookSlot(
  String token,
  dynamic body,
  BuildContext context,
) async {
  bool result = false;
  const url = "$baseurl/book/slot";
  try {
    final response = await Dio().post(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: body,
    );
    if (response.statusCode == 200) {
      final responseData = response.data;
      final message = responseData['message'];
      final token = responseData['booking_id'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('bookingId', token);
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("$message"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Slot booked successfully');
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
    print('Error booking slot: $error');
  }
  return result;
}
