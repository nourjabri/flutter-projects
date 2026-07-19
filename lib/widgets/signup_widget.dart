import 'package:flutter/material.dart';

TextFormField signupWidget({
  required TextEditingController controller,
  required Text label,
  required TextInputType fieldType,
  bool obscureText = true,
  required String? Function(String?) validator,
  required Icon preicon,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: fieldType,
    obscureText: obscureText,
    validator: validator,
    decoration: InputDecoration(
      label: label,

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      prefixIcon: preicon,
      prefixIconColor: Color(0xffECC9EE),
    ),
  );
}
