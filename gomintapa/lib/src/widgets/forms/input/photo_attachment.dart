import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoAttachment extends StatefulWidget {
  final double containerWidth;

  const PhotoAttachment({
    Key? key,
    required this.containerWidth,
  }) : super(key: key);

  @override
  _PhotoAttachmentState createState() => _PhotoAttachmentState();
}

class _PhotoAttachmentState extends State<PhotoAttachment> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      print('Selected image: ${pickedFile.path}'); // 디버깅 로그 추가
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImage,
      child: Container(
        width: widget.containerWidth,
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Color(0xff9B9B9B), width: 1),
        ),
        child: _selectedImage == null
            ? const Row(
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
                      fontFamily: 'NanumSquare_ac',
                      fontSize: 16,
                      color: Color(0xff9B9B9B),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              )
            : Image.file(
                _selectedImage!,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
