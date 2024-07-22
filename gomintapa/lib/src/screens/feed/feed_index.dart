import 'package:flutter/material.dart';

import '../../widgets/buttons/create_post_button.dart';
import '../../widgets/sections/filter_section.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  // 선택된 키워드를 저장할 Set
  final Set<String> _selectedKeywords = {};

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return _buildFilterSheet();
      },
    );
  }

  Widget _buildFilterSheet() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      // 높이와 너비 설정
      constraints: BoxConstraints(
        maxHeight: 280, // 바텀 시트의 최대 높이
        minHeight: 280, // 바텀 시트의 최소 높이
        maxWidth:
            MediaQuery.of(context).size.width * 0.85, // 최대 가로 길이 (화면 너비의 90%)
        minWidth: 320, // 최소 가로 길이
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60.0,
          horizontal: 30.0,
        ),
        child: GridView.count(
          crossAxisCount: 3, // 3개 버튼을 한 줄에 배치
          crossAxisSpacing: 20.0, // 버튼 사이의 가로 간격
          mainAxisSpacing: 40.0, // 버튼 사이의 세로 간격
          shrinkWrap: true, // 콘텐츠 크기에 맞게 크기 조정
          children: [
            _buildFilterButton('여행'),
            _buildFilterButton('친구'),
            _buildFilterButton('음악'),
            _buildFilterButton('영화'),
            _buildFilterButton('운동'),
            _buildFilterButton('음식'),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    // final bool isSelected = _selectedKeywords.contains(text);

    return Container(
      width: 80,
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          // setState(() {
          //   if (isSelected) {
          //     _selectedKeywords.remove(text); // 선택 해제
          //   } else {
          //     _selectedKeywords.add(text); // 선택 추가
          //   }
          // });
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        style: OutlinedButton.styleFrom(
          // backgroundColor: Colors.white,
          // backgroundColor: isSelected ? Colors.blue : Colors.grey,
          foregroundColor: Colors.black, //
          side: BorderSide(
            width: 1.5,
            color: Colors.grey,
            // style: BorderStyle.values,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), // 패딩
        ),
      ),
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
              )),
        ],
      ),
    );
  }
}
