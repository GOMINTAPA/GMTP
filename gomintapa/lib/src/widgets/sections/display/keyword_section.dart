import 'package:flutter/material.dart';

import '../../buttons/keyword_chip/removable_keyword_chip.dart';

class KeywordSection extends StatelessWidget {
  final List<String> keywords;

  const KeywordSection({
    Key? key,
    required this.keywords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 5, // 키워드 간의 수평 간격
            runSpacing: 10, // 키워드 간의 수직 간격
            children: keywords.map((keyword) {
              return KeywordChip(
                keyword: keyword,
                onRemoved: () {
                  setState(() {
                    _selectedKeywords.remove(keyword);
                    _keywordController.text = _selectedKeywords.join(', ');
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
