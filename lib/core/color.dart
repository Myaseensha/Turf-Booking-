import 'package:flutter/material.dart';

//style----------------------------------------
TextStyle mainTextG = TextStyle(
  color: Colors.green.shade700,
  fontWeight: FontWeight.w700,
  fontSize: 35,
);
TextStyle minTextG = TextStyle(
  color: Colors.green.shade700,
  fontWeight: FontWeight.w700,
  fontSize: 15,
);
TextStyle shortTextW = const TextStyle(
  color: Color.fromARGB(255, 254, 254, 254),
  fontWeight: FontWeight.w700,
  fontSize: 15,
);
TextStyle shortTextB = const TextStyle(
  color: Color.fromARGB(255, 0, 0, 0),
  fontWeight: FontWeight.w700,
  fontSize: 15,
);
ButtonStyle signup = ElevatedButton.styleFrom(
  foregroundColor: Cwhite,
  backgroundColor: Cgreen,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
  ),
  elevation: 5.0,
);
ButtonStyle google = ElevatedButton.styleFrom(
  foregroundColor: Cgreen,
  backgroundColor: Cwhite,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
  ),
  elevation: 5.0,
);
//color-------------------------------------------
Color Cgreen = Colors.green.shade700;
Color Cwhite = Colors.white;
Color Cblack = Colors.black;
Color Cgrey = Colors.black26;
MaterialColor? CMgeree =
    const Color.fromARGB(255, 30, 243, 37) as MaterialColor?;
