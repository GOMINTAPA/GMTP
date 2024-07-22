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
        maxHeight: 300, // 바텀 시트의 최대 높이
        minHeight: 300, // 바텀 시트의 최소 높이
        maxWidth:
            MediaQuery.of(context).size.width * 0.75, // 최대 가로 길이 (화면 너비의 90%)
        minWidth: MediaQuery.of(context).size.width * 0.75, // 최소 가로 길이
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 40.0,
                ),
                child: Wrap(
                  spacing: 20.0, // 버튼 사이의 가로 간격
                  runSpacing: 40.0, // 버튼 사이의 세로 간격
                  children: [
                    _buildFilterButton('음식'),
                    _buildFilterButton('패션'),
                    _buildFilterButton('친구'),
                    _buildFilterButton('가족'),
                    _buildFilterButton('연애'),
                    _buildFilterButton('직장'),
                    _buildFilterButton('학업'),
                    _buildFilterButton('진로'),
                    _buildFilterButton('건강'),
                    _buildFilterButton('운동'),
                    _buildFilterButton('영화'),
                    _buildFilterButton('게임'),
                    _buildFilterButton('여행'),
                    _buildFilterButton('경제'),
                    _buildFilterButton('기타'),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Color(0xffA7A7A7),
            height: 0, // Divider 위아래의 공간 제거
          ),
          Container(
            height: 55, // 버튼 영역의 높이
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // 바텀 시트 닫기
                    },
                    child: Text(
                      '닫기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // 버튼의 테두리를 네모나게
                      ),
                      elevation: 0,
                      minimumSize:
                          Size(double.infinity, 55), // 버튼이 영역을 꽉 채우도록 설정
                    ),
                  ),
                ),
                VerticalDivider(
                  thickness: 0.5,
                  color: Color(0xffA7A7A7),
                  width: 0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 적용 버튼 클릭 시 동작
                      Navigator.pop(context); // 바텀 시트 닫기
                    },
                    child: Text(
                      '적용',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // 버튼의 테두리를 네모나게
                      ),
                      elevation: 0,
                      minimumSize:
                          Size(double.infinity, 55), // 버튼이 영역을 꽉 채우도록 설정
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    final bool isSelected = _selectedKeywords.contains(text);

    return Container(
      width: 80,
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (isSelected) {
              _selectedKeywords.remove(text); // 선택 해제
            } else {
              _selectedKeywords.add(text); // 선택 추가
            }
          });
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: isSelected ? Color(0xff0E83EF) : Colors.black,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1.5,
            color: isSelected ? Color(0xff0E83EF) : Color(0xffA7A7A7),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
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
            ),
          ),
        ],
      ),
    );
  }
}
