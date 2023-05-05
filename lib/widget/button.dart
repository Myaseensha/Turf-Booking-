import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';

import '../core/padding.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.colorB,
    required this.colorF,
    required this.title,
    required this.style,
    required this.onpress,
  }) : super(key: key);
  final Color colorF;
  final Color colorB;
  final String title;
  final TextStyle style;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: p10,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onpress,
          style: ElevatedButton.styleFrom(
            foregroundColor: colorF,
            backgroundColor: colorB,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            elevation: 10.0,
          ),
          child: Padding(
            padding: p10,
            child: Text(title, style: style),
          ),
        ),
      ),
    );
  }
}

fancyfunctionButton(
  Color colorI,
  double width,
  double sizeT,
  IconData icon,
  double maxWidth,
  double maxHeight, {
  String ratings = " ",
  required String text,
  required VoidCallback onpress,
}) {
  return SizedBox(
    height: maxHeight * 0.085,
    width: maxWidth * width,
    child: ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Color.fromARGB(205, 158, 158, 158), width: 1.7),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: colorI,
              ),
              Text(
                textAlign: TextAlign.end,
                ratings,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(
              color: conBlack,
              fontSize: sizeT,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
