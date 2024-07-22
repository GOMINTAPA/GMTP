import 'package:flutter/material.dart';

import '../../widgets/buttons/create_post_button.dart';
import '../../widgets/sections/filter_bar_section.dart';
import '../../widgets/sections/filter_sheet.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  // 선택된 키워드를 저장할 Set
  final Set<String> _selectedKeywords = {};

  // 필터 모달
  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // 배경색을 투명으로 설정
      builder: (BuildContext context) {
        // FilterSheet를 모달로 표시
        return FilterSheet(
          selectedKeywords: _selectedKeywords, // 현재 선택된 키워드
          onKeywordSelected: (keyword) {
            // 키워드가 선택되거나 선택 해제될 때 호출됨
            setState(() {
              if (_selectedKeywords.contains(keyword)) {
                _selectedKeywords.remove(keyword); // 키워드 선택 해제
              } else {
                _selectedKeywords.add(keyword); // 키워드 선택 추가
              }
            });
          },
          onClose: () => Navigator.pop(context), // 바텀 시트를 닫기 위한 콜백
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                FilterSection(
                  onFilterPressed: () => _showFilterModal(context),
                ),
                // 다른 위젯이 추가될 수 있음
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CreatePostButton(
              onPressed: () {
                // 고민 작성 버튼 클릭 시 동작
              },
            ),
          ),
        ],
      ),
    );
  }
}
