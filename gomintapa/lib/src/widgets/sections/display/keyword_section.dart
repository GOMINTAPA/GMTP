import 'package:flutter/material.dart';

import '../../buttons/keyword_chip/keyword_chip.dart';

class KeywordSection extends StatelessWidget {
  final List<String> keywords;

  const KeywordSection({
    Key? key,
    required this.keywords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            runSpacing: 15.0, // 키워드 간의 수직 간격
            children: keywords.map((keyword) {
              return KeywordChip(keyword: keyword);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
