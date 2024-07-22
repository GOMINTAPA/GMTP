import 'package:flutter/material.dart';

import '../../widgets/navigation/form_action_app_bar.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  // 제목과 내용을 저장할 컨트롤러
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormActionAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(0), // 전체 padding 제거
        children: [
          Container(
            color: Colors.white, // 배경색을 흰색으로 설정
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
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: '제목',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
                  maxLines: 1,
                  // maxLength: 100, // 제목 최대 길이
                ),
                SizedBox(height: 20), // 제목과 내용 입력란 사이 간격
                // 내용 입력란
                TextField(
                  controller: _contentControlle,
                  decoration: InputDecoration(
                    hintText: '내용을 입력하세요.',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
                  style: TextStyle(fontSize: 14),
                  maxLines: 10,
                  // maxLength: 1000, // 내용 최대 길이
                  keyboardType: TextInputType.multiline, // 멀티 라인 입력 설정
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitPost() {
    final String title = _titleController.text;
    final String content = _contentControlle.text;

    // TODO: 제출 로직 구현 (예: 서버에 데이터 전송, 로컬 저장 등)

    // 예시로 데이터를 콘솔에 출력
    print('제목: $title');
    print('내용: $content');
  }
}
