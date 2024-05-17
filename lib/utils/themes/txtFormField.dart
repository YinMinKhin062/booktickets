import 'package:flutter/material.dart';

class TxtFormField {
  TxtFormField._();

  static InputDecorationTheme inputFormDecoration = InputDecorationTheme(
    labelStyle: const TextStyle().copyWith(color: Colors.grey),
    hintStyle: const TextStyle().copyWith(color: Colors.grey),
    errorStyle: const TextStyle().copyWith(color: Colors.red),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(12)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12)),
  );
}
