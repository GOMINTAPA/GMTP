import 'package:flutter/material.dart';

class ChoicesSection extends StatelessWidget {
  final TextEditingController aInputController;

  const ChoicesSection({
    Key? key,
    required this.aInputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 화면의 너비를 비율로 계산
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.9; // 화면 너비의 90%로 설정

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 40,
        top: 10,
      ),
      child: Column(
        children: [
          Divider(
            thickness: 0.5,
            color: Color(0xffA7A7A7),
            height: 0, // Divider 위아래의 공간 제거
          ),
          SizedBox(height: 40),
          // 화면 너비의 90%로 설정
          Container(
            width: containerWidth, // 비율에 맞게 설정된 너비
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Color(0xff9B9B9B), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_rounded,
                  size: 30.0,
                  color: Color(0xff9B9B9B),
                ),
                SizedBox(width: 10), // 아이콘과 텍스트 사이 간격
                Text(
                  '사진 첨부하기',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff9B9B9B),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: containerWidth, // 비율에 맞게 설정된 너비
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xffFF9B9B),
              border: Border(
                bottom: BorderSide(
                  color: Color(0xff9B9B9B),
                  width: 1,
                ),
                left: BorderSide(
                  color: Color(0xff9B9B9B),
                  width: 1,
                ),
                right: BorderSide(
                  color: Color(0xff9B9B9B),
                  width: 1,
                ),
              ),
            ),
            child: Center(
              child: TextField(
                controller: aInputController,
                decoration: InputDecoration(
                  hintText: 'A 입력',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 10.0),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
