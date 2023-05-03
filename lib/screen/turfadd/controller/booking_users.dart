import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/model/user_detials.dart';
import 'package:turf/screen/turfadd/utils/url.dart';

Future<List<BookingUser>> bookedUsers(
  String token,
  BuildContext context,
) async {
  final url = Uri.parse('$baseUrlTurf/booked-details');

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final List<dynamic> data = json.decode(response.body);
    final List<BookingUser> courts = [];

    for (var courtData in data) {
      final court = BookingUser.fromJson(courtData);

      courts.add(court);
    }
    print(responseData);
    return courts;
  } else {
    throw Exception('Failed to fetch data');
  }
}
