import 'package:flutter/material.dart';

import '../../../core/padding.dart';

class ReviewCard extends StatelessWidget {
  final String username;
  final String review;
  final num rating;

  const ReviewCard(
      {super.key,
      required this.username,
      required this.review,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: const Icon(Icons.person_outline, color: Colors.grey),
        ),
        title: Padding(
          padding: pBT10,
          child: Text(
            username,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        trailing: SizedBox(
          width: 80.0,
          child: Row(
            children: <Widget>[
              const Icon(Icons.star, color: Colors.yellow),
              const SizedBox(width: 10.0),
              Text(
                rating.toString(),
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            review,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
