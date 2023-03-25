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
TextStyle shortTextBlack = const TextStyle(
  color: Color.fromARGB(255, 0, 0, 0),
  fontWeight: FontWeight.w700,
  fontSize: 15,
);
TextStyle shortTextBS = const TextStyle(
  color: Color.fromARGB(255, 0, 0, 0),
  fontWeight: FontWeight.w400,
  fontSize: 15,
);
ButtonStyle signup = ElevatedButton.styleFrom(
  foregroundColor: conWhite,
  backgroundColor: conGreen,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
  ),
  elevation: 5.0,
);
ButtonStyle google = ElevatedButton.styleFrom(
  foregroundColor: conGreen,
  backgroundColor: conWhite,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
  ),
  elevation: 5.0,
);
//color-------------------------------------------
Color conGreen = Colors.green.shade700;
Color conWhite = Colors.white;
Color conBlack = Colors.black;
Color conGrey = Colors.black26;
MaterialColor? conMgeree =
    const Color.fromARGB(255, 30, 243, 37) as MaterialColor?;
