import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NorthernTheme {
  static TextTheme textTheme = GoogleFonts.latoTextTheme().copyWith(
    headline: TextStyle(fontSize: 32, fontWeight: FontWeight.w300, color: Colors.white),
    subhead: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.w400)
  );
}
