import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/controllers/user_controller.dart';

import 'utils/modals/keyword_modal_util.dart';
import 'widgets/navigation/bottom_navigation_bar.dart';

import 'package:gomintapa/src/screens/feed/mak_feed_index.dart';
import 'package:gomintapa/src/screens/feed/tang_feed_index.dart';

import 'widgets/navigation/home_app_bar.dart';
import 'screens/feed/feed_index.dart';
import 'widgets/sections/feed/filter_bar_section.dart';

// 화면에 표시할 위젯 목록
final List<Widget> myTabItems = [MakFeedIndex(), FeedIndex(), TangFeedIndex()];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 현재 선택된 인덱스
  int _selectedIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  final userController = Get.put(UserController());

  // 선택된 키워드를 저장할 Set
  final Set<String> _selectedKeywords = {};

  // 바텀 네비게이션 바의 아이템이 클릭되었을 때
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 페이지 전환 애니메이션
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  void initState() {
    super.initState();
    userController.myInfo();
    print('userController');
  }

  @override
  void dispose() {
    // PageController의 리소스 해제
    _pageController.dispose();
    super.dispose();
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
      appBar: HomeAppBar(), // 상단 앱 바
      body: Column(
        mainAxisSize: MainAxisSize.min, // Column의 main axis size를 최소화하여 여백 제거
        children: [
          // 필터 바 섹션
          FilterBarSection(
            // 필터 버튼과 선택된 키워드를 표시하는 섹션
            onFilterPressed: _showKeywordModal, // 버튼 클릭 시 필터 모달 표시
            selectedKeywords: _selectedKeywords, // 현재 선택된 키워드 전달
            onKeywordRemoved: _removeKeyword, // 키워드 삭제 콜백 함수
          ),
          Expanded(
            child: PageView(
              controller: _pageController, // 페이지 전환을 위한 컨트롤러
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index; // 페이지 변경 시 인덱스 업데이트
                });
              },
              children: myTabItems, // 페이지 뷰에 표시할 위젯 목록
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex, // 현재 선택된 인덱스
        onItemTapped: _onItemTapped, // 아이템 클릭 시 호출
      ),
    );
  }
}
