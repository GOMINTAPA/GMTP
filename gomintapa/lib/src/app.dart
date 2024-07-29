import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'home.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';
import 'screens/my/mypage.dart';
import 'screens/post/create_post.dart';

class MyWidget extends StatelessWidget {
  final bool isLogin;
  const MyWidget(this.isLogin, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 삭제
      routes: {
        '/': (context) => Login(),
        '/create_post': (context) => CreatePost(),
        '/mypage': (context) => MyPage(),
        '/intro': (context) => Login(),
        '/register': (context) => Register(),
      },
      //initialRoute: isLogin ? '/' : '/intro',
    );
  }
}
//test