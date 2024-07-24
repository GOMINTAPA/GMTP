import 'package:flutter/material.dart';
import 'package:gomintapa/src/screens/my/mypage.dart';
import 'package:gomintapa/src/widgets/buttons/create_post_button.dart';
import 'package:gomintapa/src/widgets/listitems/mak_list_item.dart';
import 'package:gomintapa/src/widgets/sections/feed/filter_bar_section.dart';

import '../../utils/modals/keyword_modal_util.dart';

class MakFeedIndex extends StatefulWidget {
  const MakFeedIndex({super.key});

  @override
  State<MakFeedIndex> createState() => _MakFeedIndexState();
}

class _MakFeedIndexState extends State<MakFeedIndex> {
  // 선택된 키워드를 저장할 Set
  final Set<String> _selectedKeywords = {};

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
              Container(
                color: Colors.white, // 배경색
                child: FilterBarSection(
                  onFilterPressed: _showKeywordModal, // 버튼 클릭 시 필터 모달 표시
                  selectedKeywords: _selectedKeywords, // 현재 선택된 키워드 전달
                  onKeywordRemoved: _removeKeyword, // 키워드 삭제 콜백 함수
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    MakListItem(
                        onTap: () => _navigateToMyPage(context)), // 임시 설정
                    MakListItem(onTap: () => _navigateToMyPage(context)),
                    MakListItem(onTap: () => _navigateToMyPage(context)),
                    MakListItem(onTap: () => _navigateToMyPage(context)),
                    MakListItem(onTap: () => _navigateToMyPage(context)),
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
