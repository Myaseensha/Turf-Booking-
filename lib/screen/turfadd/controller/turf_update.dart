import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/utils/url.dart';
import 'package:turf/screen/turfadd/view/profile_page.dart';

Future turfUpdate(
    String token, Map<String, dynamic> data, BuildContext context) async {
  try {
    final response = await http.patch(
      Uri.parse('$baseUrlTurf/update-turf-profile'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final message = responseData['message'];
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('$message'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => TurfProfile(token: token),
          ),
          (route) => false);
    }
  } catch (e) {
    print(e);
  }
}
