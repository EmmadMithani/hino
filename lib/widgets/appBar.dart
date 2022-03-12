import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar({required String text}) {
  return AppBar(
      elevation: 04,
      title: Text(
        "$text",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ));
}
