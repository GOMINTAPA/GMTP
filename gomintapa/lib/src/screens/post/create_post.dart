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
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _aInputController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _aInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 너비를 비율로 계산
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth * 0.9; // 화면 너비의 90%로 설정

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
                  // maxLength: 100, // 제목 최대 길이
                ),
                SizedBox(height: 20), // 제목과 내용 입력란 사이 간격
                // 내용 입력란
                TextField(
                  controller: _contentController,
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
          Container(
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
                      controller: _aInputController,
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
          ),
        ],
      ),
    );
  }

  void _submitPost() {
    final String title = _titleController.text;
    final String content = _contentController.text;
    final String aInput = _aInputController.text;

    // TODO: 제출 로직 구현 (예: 서버에 데이터 전송, 로컬 저장 등)

    // 예시로 데이터를 콘솔에 출력
    print('제목: $title');
    print('내용: $content');
    print('A 입력: $aInput');
  }
}
