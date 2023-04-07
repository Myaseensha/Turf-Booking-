import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/utils/url.dart';

import '../model/turf_get.dart';

Future<List<Court>> fetchCourts(String query) async {
  final response = await http.get(Uri.parse(turfgeturi));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    final List<Court> courts = [];

    for (var courtData in data) {
      final court = Court.fromJson(courtData);
      if (query.isEmpty ||
          court.courtName.toLowerCase().contains(query.toLowerCase())) {
        courts.add(court);
      }
    }

    return courts;
  } else {
    throw Exception('Failed to fetch courts');
  }
}
