import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/feed_controller.dart';
import 'package:gomintapa/src/widgets/listitems/concern_list_item.dart';

import '../../utils/modals/keyword_modal_util.dart';
import '../../widgets/buttons/create_post_button.dart';
import '../../widgets/sections/feed/filter_bar_section.dart';

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

  // 키워드를 삭제하는 메서드
  void _removeKeyword(String keyword) {
    setState(() {
      _selectedKeywords.remove(keyword); // 키워드를 선택된 키워드 집합에서 제거
    });
  }

  // 키워드 선택 모달을 표시하고, 사용자가 선택한 키워드를 처리
  void _showKeywordModal() async {
    // showKeywordModal을 호출하여 키워드 선택 모달 표시
    // 사용자가 선택한 키워드 목록 반환
    final selectedKeywords = await showKeywordModal(
      context: context, // 현재 context를 전달하여 모달 표시
      selectedKeywords: _selectedKeywords, // 현재 선택된 키워드 집합을 전달하여 초기 선택 상태 설정
    );
    // 사용자가 키워드를 선택했을 경우
    if (selectedKeywords != null) {
      setState(() {
        // 현재 선택된 키워드 모두 제거
        _selectedKeywords.clear();
        // 새로 선택한 키워드를 _selectedKeywords에 추가
        _selectedKeywords.addAll(selectedKeywords);
      });
    }
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
                  onFilterPressed: _showKeywordModal, // 버튼 클릭 시 필터 모달 표시
                  selectedKeywords: _selectedKeywords, // 현재 선택된 키워드 전달
                  onKeywordRemoved: _removeKeyword, // 키워드 삭제 콜백 함수
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          Expanded(
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
          // 하단 중앙에 위치한 '고민 작성' 버튼
          Align(
            alignment: Alignment.bottomCenter,
            child: CreatePostButton(
              onPressed: () {
                // 버튼 클릭 시 고민 작성 페이지로 이동
                Navigator.pushNamed(context, '/create_post');
              },
            ),
          ),
        ],
      ),
    );
  }
}
