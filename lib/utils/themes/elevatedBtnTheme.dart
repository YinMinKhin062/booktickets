import 'package:flutter/material.dart';

class ElevatedBtnTheme{
  ElevatedBtnTheme._();
  static final elevatedBtn=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
      backgroundColor: Colors.blue.shade300,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14)
    )
  );
}