import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static const Color primaryColor = Color(0xFF4FC3F7);
  static const Color accentColor = Color(0xFFBBDEFB);
  static const Color cardBackground = Color(0xCCFFFFFF);

  static final LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFFBBDEFB), Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient calendarGradient = LinearGradient(
    colors: [Color(0xFF42A5F5), Color(0xFFBBDEFB)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final TextStyle headerText = GoogleFonts.oswald(
    fontSize: 24, // Slightly larger for Oswald's bold style
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static final TextStyle bodyText = GoogleFonts.oswald(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
  );

  static final TextStyle calendarText = GoogleFonts.oswald(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final TextStyle calendarActiveText = GoogleFonts.oswald(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardBackground,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
    ],
  );

  static BoxDecoration glassCardDecoration = BoxDecoration(
    color: Colors.white.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.white.withOpacity(0.2)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        spreadRadius: 1,
      ),
    ],
  );

  static BoxDecoration activeCardDecoration = BoxDecoration(
    color: accentColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: accentColor.withOpacity(0.4),
        blurRadius: 8,
        spreadRadius: 2,
      ),
    ],
  );
}
