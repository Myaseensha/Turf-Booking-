import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turf/core/color.dart';

import '../core/padding.dart';

class FromField extends StatelessWidget {
  FromField(
      {Key? key,
      required this.hint,
      this.keytype,
      this.textleangthe,
      required this.validetmsg,
      required this.controllers,
      required this.bordercolor})
      : super(key: key);
  final String hint;
  final String validetmsg;
  final TextEditingController controllers;
  final Color bordercolor;
  TextInputType? keytype = TextInputType.name;
  int? textleangthe = 30;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pTRL20,
      child: TextFormField(
        style: TextStyle(color: Cgreen),
        inputFormatters: [LengthLimitingTextInputFormatter(textleangthe)],
        controller: controllers,
        keyboardType: keytype,
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
