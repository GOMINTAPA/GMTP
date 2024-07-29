import 'package:flutter/material.dart';

class ContentSection extends StatelessWidget {
  final String title;
  final String content;

  const ContentSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'NanumSquare_ac',
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'NanumSquare_ac',
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
