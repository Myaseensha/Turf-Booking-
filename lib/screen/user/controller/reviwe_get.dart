import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/utils/url.dart';

import '../model/review_model.dart';

Future<List<ReviewGet>> reviewGet(String id) async {
  try {
    final response = await http.get(
      Uri.parse(
        '$baseUrlTurf/get-review?id=$id',
      ),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return List<ReviewGet>.from(json.map((item) => ReviewGet.fromJson(item)));
    } else {
      throw Exception('Failed to fetch reviews');
    }
  } catch (e) {
    log(id);
    log(e.toString());
    throw Exception('Failed to fetch reviews: $e');
  }
}
