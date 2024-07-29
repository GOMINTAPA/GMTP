import 'package:flutter/material.dart';

class InputSection extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;

  const InputSection({
    Key? key,
    required this.titleController,
    required this.contentController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          // 제목 입력란
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: '제목',
              hintStyle: TextStyle(
                fontFamily: 'NanumSquare_ac',
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff9B9B9B),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xff0E83EF), width: 1), // 포커스 시 경계선 설정
              ),
            ),
            style: TextStyle(fontSize: 16),
            // maxLength: 100, // 제목 최대 길이
          ),
          SizedBox(height: 20), // 제목과 내용 입력란 사이 간격
          // 내용 입력란
          TextField(
            controller: contentController,
            decoration: InputDecoration(
              hintText: '내용을 입력하세요.',
              hintStyle: TextStyle(
                fontFamily: 'NanumSquare_ac',
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff9B9B9B),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xff0E83EF), width: 1), // 포커스 시 경계선 설정
              ),
            ),
            style: TextStyle(fontFamily: 'NanumSquare_ac', fontSize: 14),
            maxLines: 10,
            // maxLength: 1000, // 내용 최대 길이
            keyboardType: TextInputType.multiline, // 멀티 라인 입력 설정
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
