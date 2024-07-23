import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/feed_controller.dart';
import 'package:gomintapa/src/screens/my/mypage.dart';
import 'package:gomintapa/src/widgets/listitems/concern_list_item.dart';

import '../../widgets/buttons/create_post_button.dart';
import '../../widgets/sections/filter_bar_section.dart';
import '../../widgets/sections/filter_sheet.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  final feedController = Get.put(FeedController());
  // 선택된 키워드를 저장할 Set
  final Set<String> _selectedKeywords = {};
  int _currentPage = 1;

  bool _onNotification(ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.extentAfter == 0) {
      feedController.feedIndex(page: ++_currentPage);
      return true;
    }
    return false;
  }

  Future<void> _onRefresh() async {
    _currentPage = 1;
    await feedController.feedIndex();
  }
  // 필터 모달
  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // 바텀 시트의 배경색을 투명으로 설정
      builder: (BuildContext context) {
        // FilterSheet 위젯을 모달로 표시
        return FilterSheet(
          initialSelectedKeywords: _selectedKeywords, // 현재 선택된 키워드 전달
          onApply: (selectedKeywords) {
            // '적용' 버튼 클릭 시 호출되는 콜백
            setState(() {
              // 선택된 키워드를 상태에 반영
              _selectedKeywords.clear();
              _selectedKeywords.addAll(selectedKeywords);
            });
          },
          onClose: () => Navigator.pop(context), // 바텀 시트를 닫기 위한 콜백
        );
      },
    );
  }

  // 키워드를 삭제하는 메서드
  void _removeKeyword(String keyword) {
    setState(() {
      _selectedKeywords.remove(keyword); // 키워드를 선택된 키워드 집합에서 제거
    });
  }

  // 페이지 이동 메서드 : 이동만 확인하려고 임시로 MyPage로 설정해둠
  void _navigateToMyPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white, // 배경색
            child: Column(
              children: [
                // 필터 버튼과 선택된 키워드를 표시하는 섹션
                FilterBarSection(
                  onFilterPressed: () =>
                      _showFilterModal(context), // 필터 버튼 클릭 시 필터 모달 표시
                  selectedKeywords: _selectedKeywords, // 현재 선택된 키워드 전달
                  onKeywordRemoved: _removeKeyword, // 키워드 삭제 콜백 함수
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          Expanded(
            // child: ListView(
            //   children: [
            //     ConcernListItem(
            //         onTap: () => _navigateToMyPage(context)), // 임시 설정
            //     ConcernListItem(onTap: () => _navigateToMyPage(context)),
            //     ConcernListItem(onTap: () => _navigateToMyPage(context)),
            //     ConcernListItem(onTap: () => _navigateToMyPage(context)),
            //     ConcernListItem(onTap: () => _navigateToMyPage(context)),
            //   ],
            // ),
            child: Obx(
              () => NotificationListener<ScrollNotification>(
                onNotification: _onNotification,
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: ListView.builder(
                    itemCount: feedController.feedList.length,
                    itemBuilder: (context, index) {
                      final item = feedController.feedList[index];
                      return ConcernListItem(item);
                    },
                    ),
                  ), 
              ),
            ),
          ),
          //),
          // 하단 중앙에 위치한 '고민 작성' 버튼
          Align(
            alignment: Alignment.bottomCenter,
            child: CreatePostButton(
              onPressed: () {
                // 고민 작성 버튼 클릭 시 고민 작성 페이지로 이동
                Navigator.pushNamed(context, '/create_post');
              },
            ),
          ),
        ],
      ),
    );
  }
}
