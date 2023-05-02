import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:turf/screen/user/model/single_turf_get.dart';
import '../utils/base_url.dart';

Future<SingleCourt> fetchSingleCourts(String id) async {
  try {
    final response = await http.get(
      Uri.parse(
        '$singleturfurl?id=$id',
      ),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return SingleCourt.fromJson(json);
    } else {
      throw Exception('Failed to fetch courts');
    }
  } catch (e) {
    log(id);
    log(e.toString());
    throw Exception('Failed to fetch courts: $e');
  }
}
