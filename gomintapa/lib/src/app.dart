import 'package:flutter/material.dart';
import 'package:gomintapa/src/screens/login.dart';
import 'package:gomintapa/src/screens/register.dart';

import 'screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 삭제
      // 공통 테마 설정 : 로그인, 회원가입 화면
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 224, 224, 224),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 155, 155, 155),
              fontWeight: FontWeight.bold),
          floatingLabelStyle: TextStyle(fontSize: 12),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
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
            fontFamily: 'Roboto',
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
                fontFamily: 'Roboto'),
            minimumSize: const Size(280, 50),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF3C3C3C)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      routes: {
        '/': (context) => Register(),
        '/login': (context) => Login(),
      },
      initialRoute: '/',
      // home: Intro(),
    );
  }
}
