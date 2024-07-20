import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget {
  final String label;
  final String hintText;
  //final TextEditingController controller; // TextField의 입력 값 제어
  final bool isObscure; // TextField의 입력 값 숨김 여부
  final TextInputType? keyboardType;

  const LabelTextField({
    super.key,
    required this.label,
    required this.hintText,
    //required this.controller,
    this.isObscure = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        TextField(
          //controller: controller,
          obscureText: isObscure,
          keyboardType: TextInputType.phone,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            filled: true, // 배경색 적용을 위해 true로 설정
            fillColor: Colors.white, // 배경색을 흰색으로 설정
            hintText: hintText,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
