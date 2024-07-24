import 'package:flutter/material.dart';
import 'package:gomintapa/src/screens/my/mypage.dart';
import 'package:gomintapa/src/widgets/buttons/create_post_button.dart';
import 'package:gomintapa/src/widgets/listitems/mak_list_item.dart';

class MakFeedIndex extends StatefulWidget {
  const MakFeedIndex({super.key});

  @override
  State<MakFeedIndex> createState() => _MakFeedIndexState();
}

class _MakFeedIndexState extends State<MakFeedIndex> {
  // 페이지 이동 메서드 : 이동만 확인하려고 임시로 MyPage로 설정해둠
  void _navigateToMyPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Mypage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    MakListItem(
                      onTap: () => _navigateToMyPage(context),
                      initialVoteDifference: 1,
                    ), // 임시 설정
                    MakListItem(
                      onTap: () => _navigateToMyPage(context),
                      initialVoteDifference: 2,
                    ),
                    MakListItem(
                      onTap: () => _navigateToMyPage(context),
                      initialVoteDifference: 3,
                    ),
                    MakListItem(
                      onTap: () => _navigateToMyPage(context),
                      initialVoteDifference: 1,
                    ),
                    MakListItem(
                      onTap: () => _navigateToMyPage(context),
                      initialVoteDifference: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 하단 중앙에 위치한 '고민 작성' 버튼
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: CreatePostButton(
                onPressed: () {
                  // 버튼 클릭 시 고민 작성 페이지로 이동
                  Navigator.pushNamed(context, '/create_post');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
