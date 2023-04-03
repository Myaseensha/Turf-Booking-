import 'package:flutter/material.dart';

import '../../../core/color.dart';

class TurfSearchBar extends StatelessWidget {
  const TurfSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: conWhite,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search for turfs or bookings',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
      ),
    );
  }
}
