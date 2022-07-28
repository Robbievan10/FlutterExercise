import 'package:flutter/material.dart';

class HomePageTheme {
  static EdgeInsetsGeometry textFieldPadding =
      const EdgeInsets.symmetric(horizontal: 40, vertical: 30);
  static Color addProductButtonColor = Colors.blue;
  static ShapeBorder addProductButtonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );
  static Widget separator = const SizedBox(height: 20);
  static Widget divider = const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30), child: Divider());
}
