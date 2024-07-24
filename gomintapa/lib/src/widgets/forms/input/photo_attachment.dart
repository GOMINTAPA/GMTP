import 'package:flutter/material.dart';

class PhotoAttachment extends StatelessWidget {
  final double containerWidth;

  const PhotoAttachment({
    Key? key,
    required this.containerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 여기에 갤러리에서 사진 고르는 기능 추가
      },
      child: Container(
        width: containerWidth,
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Color(0xff9B9B9B), width: 1),
        ),
        child: const Row(
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
