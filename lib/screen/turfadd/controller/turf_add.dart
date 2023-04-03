import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf/screen/turfadd/view/profile_page.dart';

import '../model/turf_add.dart';
import '../utils/url.dart';

Future<void> createCourt(BuildContext context, CourtAdd court) async {
  final dio = Dio();
  final headers = {'Content-Type': 'application/json'};
  try {
    final formData = FormData.fromMap({
      'court': jsonEncode(court.toJson()),
      'images': await MultipartFile.fromFile(court.imageFiles[0].path),
    });

    final response = await dio.post(ceratcourt,
        data: formData, options: Options(headers: headers));

    if (response.statusCode == 200) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const TurfProfile(),
          ),
          (route) => false);
    } else {
      log(response.statusMessage.toString());
    }
  } catch (e) {
    log(e.toString());

    const snackBar = SnackBar(
      content: Text('Plese check your mobile data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
