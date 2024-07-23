import 'package:flutter/material.dart';
import 'package:gomintapa/src/screens/auth/login.dart';
import 'package:gomintapa/src/screens/auth/register.dart';
import 'package:gomintapa/src/screens/feed/feed_index.dart';
import 'package:gomintapa/src/screens/feed/mak_feed_index.dart';
import 'package:gomintapa/src/screens/feed/tang_feed_index.dart';
import 'screens/home.dart';
import 'screens/my/mypage.dart';
import 'screens/post/create_post.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 삭제
      routes: {
        '/': (context) => Home(),
        '/create_post': (context) => CreatePost(),
        '/mypage': (context) => MyPage(),
        // '/': (context) => Login(),
        // '/register': (context) => Register(),
      },
      initialRoute: '/',
      // home: Intro(),
    );
  }
}
