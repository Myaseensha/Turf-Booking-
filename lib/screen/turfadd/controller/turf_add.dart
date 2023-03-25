import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/turf_add.dart';

Future<void> createCourt(CourtAdd court) async {
  final dio = Dio();

  try {
    final formData = FormData.fromMap({
      'court': jsonEncode(court.toJson()),
      'imageFile': await MultipartFile.fromFile(court.imageFile.path),
    });

    final response = await dio.post(
      'http://your-nodejs-api-url.com/courts',
      data: formData,
    );

    if (response.statusCode == 201) {
      print('Court created successfully');
    } else {
      print('Failed to create court: ${response.statusMessage}');
    }
  } catch (e) {
    print('Failed to create court: $e');
  }
}
