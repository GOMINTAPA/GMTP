import 'package:flutter/material.dart';

import '../../shared/keyword_data.dart';
import '../buttons/filter_sheet_button.dart';

class FilterSheet extends StatelessWidget {
  final Set<String> selectedKeywords; // 현재 선택된 키워드의 집합
  final ValueChanged<String> onKeywordSelected; // 키워드가 선택될 때 호출될 콜백 함수
  final VoidCallback onClose; // 바텀 시트를 닫을 때 호출될 콜백 함수

  // 생성자
  const FilterSheet({
    Key? key,
    required this.selectedKeywords,
    required this.onKeywordSelected,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // BottomSheet의 배경색과 모서리 둥글기 설정
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      // 높이와 너비 설정
      constraints: BoxConstraints(
        maxHeight: 300, // 바텀 시트의 최대 높이
        minHeight: 300, // 바텀 시트의 최소 높이
        maxWidth:
            MediaQuery.of(context).size.width * 0.75, // 최대 너비 (화면 너비의 75%)
        minWidth: MediaQuery.of(context).size.width * 0.75, // 최소 너비
      ),
      child: Column(
        children: [
          // 스크롤 할 수 있도록 구성
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 40.0),
                child: Wrap(
                  spacing: 20.0, // 버튼 사이의 가로 간격
                  runSpacing: 40.0, // 버튼 사이의 세로 간격
                  children: _buildFilterButtons(), // 키워드 버튼 생성
                ),
              ),
            ),
          ),
          // 상단 버튼과 하단 버튼 구분을 위한 Divider
          Divider(
            thickness: 0.5,
            color: Color(0xffA7A7A7),
            height: 0, // Divider 위아래의 공간 제거
          ),
          // 하단에 닫기 및 적용 버튼 배치
          Container(
            height: 55, // 버튼 영역의 높이
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onClose, // 바텀 시트를 닫기 위한 콜백 함수
                    child: Text(
                      '닫기',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // 버튼의 테두리를 네모나게 설정
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
                  width: 0, // 수직 구분선의 너비를 0으로 설정하여 버튼 사이의 공간을 없앰
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
                        borderRadius: BorderRadius.zero, // 버튼의 테두리를 네모나게 설정
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

  // 필터 버튼 목록 생성
  List<Widget> _buildFilterButtons() {
    return keywords.map((text) {
      // 각 키워드에 대해 FilterSheetButton 생성
      final bool isSelected = selectedKeywords.contains(text);

      return FilterSheetButton(
        text: text,
        isSelected: isSelected,
        onPressed: () => onKeywordSelected(text),
      );
    }).toList();
  }
}
