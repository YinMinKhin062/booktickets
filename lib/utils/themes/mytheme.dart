import 'package:booktickets/utils/themes/elevatedBtnTheme.dart';
import 'package:booktickets/utils/themes/textSelectionTheme.dart';
import 'package:booktickets/utils/themes/txtFormField.dart';
import 'package:flutter/material.dart';

class MyTheme {
  MyTheme._();
  static ThemeData myTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: TxtFormField.inputFormDecoration,
    elevatedButtonTheme: ElevatedBtnTheme.elevatedBtn,
    textSelectionTheme: textSelectionTheme.txtSelectionTheme,
  );
}
