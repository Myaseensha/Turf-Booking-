import 'package:flutter/material.dart';

import '../core/color.dart';
import '../core/padding.dart';

class CategoryButton extends StatelessWidget {
  final String title;

  const CategoryButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: pR10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: conBlack,
            border: Border.all(width: 2, color: conWhite),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              title,
              style: TextStyle(
                color: conWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
