import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gomintapa/src/screens/my/mypage.dart';

import 'home.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';

import 'screens/post/create_post.dart';
import 'screens/post/post_detail.dart';

class MyWidget extends StatelessWidget {
  final bool isLogin;
  const MyWidget(this.isLogin, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false, // 디버그 배너 삭제
      routes: {
        '/': (context) => Login(),
        '/create_post': (context) => CreatePost(),
        '/mypage': (context) => Mypage(),
        '/intro': (context) => Login(),
        '/register': (context) => Register(),
        // GetMaterialApp의 routes에서는 인자를 전달하지 않기 때문에 주석 처리
        // '/post_detail': (context) => PostDetail(),
      },
      //initialRoute: isLogin ? '/' : '/intro',
    );
  }
}
//test