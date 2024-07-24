import 'package:flutter/material.dart';
import 'package:gomintapa/src/screens/my/mypage.dart';
import 'package:gomintapa/src/widgets/buttons/create_post_button.dart';
import 'package:gomintapa/src/widgets/listitems/tang_list_item.dart';

class TangFeedIndex extends StatefulWidget {
  const TangFeedIndex({super.key});

  @override
  State<TangFeedIndex> createState() => _TangFeedIndexState();
}

class _TangFeedIndexState extends State<TangFeedIndex> {
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
                    TangListItem(
                      onTap: () => _navigateToMyPage(context),
                      isOption1Winner: true, // 첫 번째 옵션이 이긴 경우
                      isOption2Winner: false,
                    ),
                    TangListItem(
                      onTap: () => _navigateToMyPage(context),
                      isOption1Winner: false, // 두 번째 옵션이 이긴 경우
                      isOption2Winner: true,
                    ),
                    TangListItem(
                      onTap: () => _navigateToMyPage(context),
                      isOption1Winner: true, // 첫 번째 옵션이 이긴 경우
                      isOption2Winner: false,
                    ),
                    TangListItem(
                      onTap: () => _navigateToMyPage(context),
                      isOption1Winner: false, // 두 번째 옵션이 이긴 경우
                      isOption2Winner: true,
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
