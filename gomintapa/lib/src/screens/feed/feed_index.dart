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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                // 필터 버튼을 포함하는 섹션
                FilterSection(
                  // 필터 버튼 클릭 시 모달 표시
                  onFilterPressed: () => _showFilterModal(context),
                ),
                // 선택된 키워드 나열
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '선택된 키워드: ${_selectedKeywords.join(', ')}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 하단 중앙에 위치한 '고민 작성' 버튼
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
