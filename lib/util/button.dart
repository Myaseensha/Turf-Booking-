import 'package:flutter/material.dart';

import '../core/padding.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.colorB,
      required this.colorF,
      required this.title,
      required this.style,
      required this.classname})
      : super(key: key);
  final Color colorF;
  final Color colorB;
  final String title;
  final TextStyle style;
  final classname;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: p10,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => classname,
                ));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: colorF,
            backgroundColor: colorB,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
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
