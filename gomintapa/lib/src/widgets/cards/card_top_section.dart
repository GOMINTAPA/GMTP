import 'package:flutter/material.dart';

class CardTopSection extends StatelessWidget {
  final String title;
  const CardTopSection({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235,
      height: 20,
      alignment: Alignment.center,
      child: Text(
        title,
        maxLines: 1, // 텍스트가 한 줄로 제한됨
        overflow: TextOverflow.ellipsis, // 텍스트 길이가 영역을 초과할 경우 말 줄임표 처리
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w800,
        ),
        softWrap: false, // 줄바꿈을 하지 않음
      ),
    );
  }
}
