import 'package:flutter/material.dart';

import '../../widgets/buttons/create_post_button.dart';
import '../../widgets/sections/filter_section.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              FilterSection(
                onFilterPressed: () {
                  // 필터 버튼 클릭 시
                },
              ),
              // 다른 위젯이 추가될 수 있음
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: CreatePostButton(
                onPressed: () {
                  // 고민 작성 버튼 클릭 시 동작
                },
              )),
        ],
      ),
    );
  }
}
