import 'package:flutter/material.dart';
import '../core/color.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  bool enabled = false,
  TextInputType keyboardType = TextInputType.name,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    style: TextStyle(color: conGreen),
    enabled: enabled,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: label,
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
    validator: validator,
  );
}
