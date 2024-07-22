import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/navigation/app_bar.dart';

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

          // 고민 정보 영역
        ],
      ),
    );
  }
}
