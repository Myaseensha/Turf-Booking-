import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:turf/screen/user/utils/base_url.dart';

Future bookingFailed(String id, String userToken) async {
  try {
    const url = "$baseurl/book/booking-failed";
    final response = await Dio().patch(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      ),
      data: json.encode({'id': id}),
    );
    if (response.statusCode == 200) {
      final responseData = response.data;
      return responseData;
    } else {
      throw Exception('Failed to mark booking as failed');
    }
  } catch (error) {
    rethrow;
  }
}
