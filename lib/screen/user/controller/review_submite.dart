import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf/screen/user/utils/base_url.dart';

Future<void> postReviewAndRating(String token, String review, double rating,
    String id, BuildContext context) async {
  const url = '$baseurl/user/review-submit';

  final dio = Dio();
  dio.options.headers = {'Authorization': 'Bearer $token'};

  try {
    final response = await dio.post(
      url,
      data: {'text': review, 'rating': rating, "id": id},
    );
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      throw Exception('Failed to submit review and rating');
    }
  } on DioError catch (e) {
    if (e.response != null) {
      throw Exception(
          'Failed to submit review and rating: ${e.response!.data}');
    } else {
      throw Exception('Failed to submit review and rating: ${e.message}');
    }
  }
}
