import 'package:flutter/material.dart';
import 'package:gomintapa/src/models/user_model.dart';
import 'package:gomintapa/src/widgets/navigation/back_app_bar.dart';
import 'package:gomintapa/src/widgets/sections/my/concern_feed_section.dart';
import 'package:gomintapa/src/widgets/sections/my/user_section.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BackAppBar(),
      body: Column(
        children: [
          // 계정 정보 영역
          UserSection(UserModel(id: 1, name: '노는게젤조아')),
          const SizedBox(height: 25),
          // 고민 정보 영역
          Expanded(
            child: ConcernFeedSection(),
          ),
        ],
      ),
    );
  }
}
