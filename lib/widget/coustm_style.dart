import 'package:flutter/material.dart';

import '../core/color.dart';

TextField formStyle(TextEditingController name, {bool enabled = false}) {
  return TextField(
    controller: name,
    style: TextStyle(color: conGreen),
    enabled: enabled,
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: conGreen),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: conGrey,
          width: 2.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: conGreen,
          width: 2.0,
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    ),
  );
}
