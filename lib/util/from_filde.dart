import 'package:flutter/material.dart';
import 'package:turf/core/color.dart';

import '../core/padding.dart';

class FromField extends StatelessWidget {
  const FromField(
      {Key? key,
      required this.hint,
      required this.validetmsg,
      required this.controllers,
      required this.bordercolor})
      : super(key: key);
  final String hint;
  final String validetmsg;
  final TextEditingController controllers;
  final Color bordercolor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pTRL20,
      child: TextFormField(
        controller: controllers,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Cgreen),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: bordercolor,
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          labelText: hint,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validetmsg;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
