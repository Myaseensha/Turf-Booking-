import 'package:flutter/material.dart';

import '../core/color.dart';
import '../core/padding.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  VoidCallback onpress;
  CategoryButton({
    Key? key,
    required this.title,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Center(
        child: Padding(
          padding: pR10,
          child: GestureDetector(
            onTap: onpress,
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: conBlack,
                border: Border.all(width: 2, color: conGreen),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                    color: conWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
