import 'package:flutter/material.dart';
import 'package:gomintapa/src/models/user_model.dart';
import 'package:gomintapa/src/widgets/navigation/app_bar.dart';
import 'package:gomintapa/src/widgets/sections/my_user_section.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          // 계정 정보 영역
          // 프로필
          MyUserSection(UserModel(id: 1, name: '노는게젤조아')),
          // 고민 정보 영역
        ],
      ),
    );
  }
}
