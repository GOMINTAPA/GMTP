import 'package:flutter/material.dart';

import '../../widgets/buttons/create_post_button.dart';
import '../../widgets/sections/filter_section.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
          ),
          Divider(),
          ListTile(
            title: Text('여행'),
            onTap: () {
              // 키워드 선택 로직
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('친구'),
            onTap: () {
              // 키워드 선택 로직
              Navigator.pop(context);
            },
          ),
        ],
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
