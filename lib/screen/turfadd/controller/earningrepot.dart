import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turf/screen/turfadd/model/earning_model.dart';
import 'dart:convert';
import 'package:turf/screen/turfadd/utils/url.dart';

Future<List<EarningReport>> earningReport(
    String token, BuildContext context) async {
  const url = '$baseUrlTurf/earning-report';
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    print('Earning report loaded successfully');
    final List<dynamic> data = jsonDecode(response.body);
    final List<EarningReport> earning = [];
    for (var earningData in data) {
      final earnings = EarningReport.fromJson(earningData);
      earning.add(earnings);
    }
    return earning;
  } else {
    throw Exception('Failed to load earning report');
  }
}
