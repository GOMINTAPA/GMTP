import 'package:flutter/material.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xffD9D9D9),
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 5),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list_rounded,
                        size: 25,
                      ),
                    ),
                    // 나중에 키워드 추가
                  ],
                ),
              ),
              // 다른 위젯이 여기 추가될 수 있음
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // 여백 추가
              child: ElevatedButton.icon(
                onPressed: () {
                  // 버튼 클릭 시 동작
                },
                icon: Icon(Icons.edit_outlined, color: Colors.red),
                label: Text(
                  '고민 작성',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // 모서리 둥글기
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20), // 패딩
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
