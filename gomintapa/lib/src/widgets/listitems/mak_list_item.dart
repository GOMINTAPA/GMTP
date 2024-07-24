import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/cards/card_bottom_section.dart';
import 'package:gomintapa/src/widgets/cards/card_section.dart';
import 'package:gomintapa/src/widgets/cards/card_top_section.dart';
import 'package:gomintapa/src/widgets/texts/custom_text.dart';

class MakListItem extends StatefulWidget {
  final VoidCallback onTap;
  final int initialVoteDifference; // 초기 투표 차이 값

  const MakListItem({
    super.key,
    required this.onTap,
    required this.initialVoteDifference,
  });

  @override
  _MakListItemState createState() => _MakListItemState();
}

class _MakListItemState extends State<MakListItem> {
  late int voteDifference; // 투표 차이 값을 저장할 상태 변수

  @override
  void initState() {
    super.initState();
    voteDifference = widget.initialVoteDifference; // 초기 투표 차이 값 설정
  }

  // 투표 차이 값을 업데이트하는 메서드
  void updateVoteDifference(int newDifference) {
    setState(() {
      voteDifference = newDifference;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        CardSection(
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 제목 영역
              const CardTopSection(
                title: '고민 제목',
              ),
              const SizedBox(height: 10),
              // 선택 항목 영역
              Stack(
                clipBehavior: Clip.none, // Stack의 클리핑 설정
                children: [
                  const CardBottomSection(
                    option1: '선택 1 내용',
                    option2: '선택 2 내용',
                  ),
                  // 중앙 텍스트 영역
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 55,
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomTextWidget(
                        strokeColorForMainText: Colors.white,
                        solidColorForMainText: Colors.red,
                        strokeColorForBorderText: Colors.white,
                        solidColorForBorderText: Colors.black,
                        mainText: '${voteDifference}%', // 투표 차이 값을 전달
                        borderText: '차이',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10), // ConcernListItem들 사이의 간격 추가
      ],
    );
  }
}
