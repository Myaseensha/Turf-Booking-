import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf/screen/turfadd/utils/url.dart';

Future<void> getBookedSlots(
    String date, String id, BuildContext context) async {
  const url = '$baseUrlTurf/booked-slots';
  try {
    final response = await Dio().get(
      url,
      queryParameters: {
        'date': date,
        'id': id,
      },
    );
    if (response.statusCode == 200) {
      final responseData = response.data;
      return responseData;
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
    print('Error getting booked slots: $error');
  }
}
