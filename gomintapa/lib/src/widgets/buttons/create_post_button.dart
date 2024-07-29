import 'package:flutter/material.dart';

class CreatePostButton extends StatefulWidget {
  final VoidCallback onPressed;

  const CreatePostButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<CreatePostButton> createState() => _CreatePostButtonState();
}

class _CreatePostButtonState extends State<CreatePostButton> {
  bool extended = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        if (extended) {
          widget.onPressed();
        }
        setState(() {
          extended = !extended;
        });
      },
      label: const Text("고민 작성"),
      isExtended: extended,
      icon: const Icon(Icons.edit_outlined, color: Colors.red),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }
}
