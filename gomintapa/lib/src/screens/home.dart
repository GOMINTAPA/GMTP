import 'package:flutter/material.dart';
import 'package:gomintapa/src/screens/feed/mak_feed_index.dart';
import 'package:gomintapa/src/screens/feed/tang_feed_index.dart';
import '../widgets/navigation/bottom_navigation_bar.dart';

import '../widgets/navigation/home_app_bar.dart';
import 'feed/feed_index.dart';

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
  void dispose() {
    // PageController의 리소스 해제
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(), // 상단 앱 바
      body: PageView(
        controller: _pageController, // 페이지 전환을 위한 컨트롤러
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index; // 페이지 변경 시 인덱스 업데이트
          });
        },
        children: myTabItems, // 페이지 뷰에 표시할 위젯 목록
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex, // 현재 선택된 인덱스
        onItemTapped: _onItemTapped, // 아이템 클릭 시 호출
      ),
    );
  }
}
