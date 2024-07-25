import 'package:gomintapa/src/models/user_model.dart';
import 'package:gomintapa/src/screens/shared/global.dart';

class FeedModel {
  late int id;
  late String title;
  late String content;
  late String firstOption;
  late String secondOption;
  int? imageId;
  DateTime? createdAt;
  bool isMe = false;
  UserModel? writer;
  late String keyword;

  get imageUrl => (imageId != null)
      ? "${Global.baseUrl}/file/$imageId"
      : "https://example.com/image.jpg";

  FeedModel({
    required this.id,
    required this.title,
    required this.content,
    required this.firstOption,
    required this.secondOption,
    this.imageId,
    required this.createdAt,
    required this.isMe,
    this.writer,
    this.keyword = '', // 기본값 설정
  });

  FeedModel.parse(Map m) {
    id = m['id'];
    title = m['title'];
    content = m['content'];
    firstOption = m['first_option'];
    secondOption = m['second_option'];
    imageId = m['image_id'];
    createdAt = DateTime.parse(m['created_at']);
    isMe = m['is_me'] ?? false;
    writer = (m['writer'] != null) ? UserModel.parse(m['writer']) : null;
    keyword = m['keyword'] ?? ''; // null 체크 및 기본값 설정
  }

  FeedModel copyWith({
    int? id,
    String? title,
    String? content,
    String? firstOption,
    String? secondOption,
    int? imageId,
    DateTime? createdAt,
    bool? isMe,
    UserModel? writer,
    String? keyword,
  }) {
    return FeedModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      firstOption: firstOption ?? this.firstOption,
      secondOption: secondOption ?? this.secondOption,
      imageId: imageId ?? this.imageId,
      createdAt: createdAt ?? this.createdAt,
      isMe: isMe ?? this.isMe,
      writer: writer ?? this.writer,
      keyword: keyword ?? this.keyword,
    );
  }
}
