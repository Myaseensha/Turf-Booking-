import 'package:flutter/material.dart';

import 'package:turf/screen/user/utils/base_url.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future getUserBookings(String token, BuildContext context) async {
  final url = Uri.parse('$baseurl/book/details');
  final headers = {'Authorization': 'Bearer $token'};
  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      print(responseData);
      return responseData;
    } else {
      final responseData = jsonDecode(response.body);
      final message = responseData['message'];
      void showSnackbar(BuildContext context, String message) {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(message),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      showSnackbar(context, message);
    }
  } catch (error) {
    print('Error fetching user bookings: $error');
  }
  return [];
}
