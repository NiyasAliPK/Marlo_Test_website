import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff242B4D);
Color buttonTxtColor = const Color(0xFF2B7CFF);

Text textWidget(
    {required String text,
    Color color = Colors.white,
    double? fontsize,
    FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontsize, fontWeight: fontWeight),
  );
}
