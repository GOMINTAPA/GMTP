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
      routes: {
        '/': (context) => Register(),
        '/login': (context) => Login(),
      },
      initialRoute: '/',
      // home: Intro(),
    );
  }
}
