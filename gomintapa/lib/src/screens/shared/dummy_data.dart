import 'package:gomintapa/src/models/feed_model.dart';

List<FeedModel> generateDummyData() {
  const List<String> keywords = [
    '음식',
    '패션',
    '친구',
    '가족',
    '연애',
    '직장',
    '학업',
    '진로',
    '건강',
    '운동',
    '영화',
    '게임',
    '여행',
    '경제',
    '기타',
  ];

  List<FeedModel> dummyData = [];
  for (int i = 0; i < 30; i++) {
    List<String> feedKeywords = i % 5 == 0
        ? []
        : [keywords[i % keywords.length], keywords[(i + 1) % keywords.length]];
    dummyData.add(FeedModel(
      id: i,
      title: '제목 $i',
      content: '내용 $i',
      firstOption: '옵션 1',
      secondOption: '옵션 2',
      createdAt: DateTime.now(),
      isMe: true,
      keywords: feedKeywords,
    ));
  }
  return dummyData;
}
