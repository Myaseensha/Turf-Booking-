import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/color.dart';

class OTPfrom extends StatelessWidget {
  const OTPfrom({
    required this.controllers,
    required this.colors,
    Key? key,
  }) : super(key: key);
  final TextEditingController controllers;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 62,
      child: TextFormField(
        controller: controllers,
        onChanged: ((value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        }),
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: colors,
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          hintText: '0',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter a valu';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
