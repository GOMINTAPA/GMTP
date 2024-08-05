import 'package:flutter/material.dart';

class AuthTheme {
  static final ThemeData loginAndRegisterTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 244, 244, 244),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 155, 155, 155),
          fontWeight: FontWeight.bold),
      floatingLabelStyle: TextStyle(fontSize: 12),
      contentPadding: EdgeInsets.symmetric(horizontal: 31, vertical: 7),
      enabledBorder: OutlineInputBorder(
        // 비활성화
        borderSide: BorderSide(color: Color.fromARGB(255, 155, 155, 155)),
      ),
      focusedBorder: OutlineInputBorder(
        // 포커스
        borderSide: BorderSide(color: Color(0xFF3C3C3C)),
      ),
    ),
    // 텍스트 설정
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 20,
        fontFamily: 'NanumSquare_ac',
        fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
        textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.50,
            fontFamily: 'NanumSquare_ac'),
        minimumSize: const Size(280, 50),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF3C3C3C)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
