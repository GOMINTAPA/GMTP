import 'package:flutter/material.dart';

import '../../widgets/navigation/form_action_app_bar.dart';
import '../../widgets/post/choices_section.dart';
import '../../widgets/post/input_section.dart';

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
    return Scaffold(
      appBar: FormActionAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(0), // 전체 padding 제거
        children: [
          InputSection(
            titleController: _titleController,
            contentController: _contentController,
          ),
          ChoicesSection(
            aInputController: _aInputController,
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
