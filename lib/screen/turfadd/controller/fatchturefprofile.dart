// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/model/court_get.dart';
import 'package:turf/screen/turfadd/utils/url.dart';

Future<CourtDetails?> fetchTurfProfile(
    String token, BuildContext context) async {
  const url = '$baseUrlTurf/turf-profile';
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return CourtDetails.fromJson(responseData);
    } else {
      final responseData = jsonDecode(response.body);
      final message = responseData['message'];
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('$message'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return null;
    }
  } catch (error) {
    return null;
  }
}
