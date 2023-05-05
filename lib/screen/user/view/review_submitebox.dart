import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf/screen/user/controller/review_submite.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key, required this.id});
  final String id;
  @override
  ReviewDialogState createState() => ReviewDialogState();
}

class ReviewDialogState extends State<ReviewDialog> {
  double _rating = 0;
  String _review = '';
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Write a review'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating'),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Review'),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter your review here',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _review = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final token = prefs.getString('token');
            postReviewAndRating(token!, _review, _rating, widget.id, context);
          },
        ),
      ],
    );
  }
}
