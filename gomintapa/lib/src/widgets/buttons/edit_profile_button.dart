import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EditProfileButton({required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          letterSpacing: 0.50,
          fontFamily: 'Roboto',
        ),
        minimumSize: const Size(280, 40),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color.fromARGB(255, 155, 155, 155),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 155, 155, 155),
      ),
      onPressed: onPressed,
      child: const Text('정보 수정'),
    );
  }
}
