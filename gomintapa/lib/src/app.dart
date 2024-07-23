import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:gomintapa/src/screens/auth/login.dart';
import 'package:gomintapa/src/screens/auth/register.dart';
import 'package:gomintapa/src/screens/feed/feed_index.dart';
import 'package:gomintapa/src/screens/feed/mak_feed_index.dart';
import 'package:gomintapa/src/screens/feed/tang_feed_index.dart';
import 'package:gomintapa/src/screens/my/mypage.dart';
import 'home.dart';
import 'screens/post/create_post.dart';

class MyWidget extends StatelessWidget {
  final bool isLogin;
  const MyWidget(this.isLogin, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 삭제
      routes: {

        '/': (context) => TangFeedIndex(),
        '/intro': (context) => Login(),
        '/register': (context) => Register(),
      },
      initialRoute: isLogin ? '/' : '/intro',
    );
  }
}
//test