import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/utils/url.dart';

Future<Map<String, dynamic>> bookingReport(String token) async {
  final url = Uri.parse('$baseUrlTurf/turf-bookings-count');
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    return result;
  } else {
    throw Exception('Failed to fetch data');
  }
}
