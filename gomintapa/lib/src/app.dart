import 'package:flutter/material.dart';
import 'package:gomintapa/src/screens/login.dart';

import 'screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 삭제
      // 공통 테마 설정 : 로그인 화면
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 224, 224, 224),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelStyle: TextStyle(fontSize: 10),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            // 비활성화
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            // 포커스
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        // 텍스트 설정
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            fontSize: 16,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 22),
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            minimumSize: const Size(double.infinity, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      routes: {
        '/': (context) => Login(),
      },
      initialRoute: '/',
      // home: Intro(),
    );
  }
}
