import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turf/screen/turfadd/view/profile_page.dart';

import '../../../utils/url.dart';
import '../model/turf_add.dart';

Future<void> createCourt(BuildContext context, CourtAdd court) async {
  final dio = Dio();

  try {
    final formData = FormData.fromMap({
      'court': jsonEncode(court.toJson()),
      'imageFile': await MultipartFile.fromFile(court.imageFiles[0].path),
    });

    final response = await dio.post(
      ceratcourt,
      data: formData,
    );

    if (response.statusCode == 200) {
      print('Court created successfully');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => TurfProfile(),
          ),
          (route) => false);
    } else {
      print('Failed to create court: ${response.statusMessage}');
    }
  } catch (e) {
    print('Failed to create court: $e');
  }
}
