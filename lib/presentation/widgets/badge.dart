import 'package:flutter/material.dart';

Widget buildCustomBadge({
  required int counter,
  required Widget child,
}) {
  final text = counter.toString();
  final deltaFontSize = (text.length - 1) * 3.0;

  return Stack(
    clipBehavior: Clip.none,
    children: [
      child,
      Positioned(
        top: -6,
        right: -20,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 10,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16 - deltaFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
