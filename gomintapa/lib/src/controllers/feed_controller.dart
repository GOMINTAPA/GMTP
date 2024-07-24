import 'package:get/get.dart';
import 'package:gomintapa/src/models/feed_model.dart';

import '../providers/feed_provider.dart';

class FeedController extends GetxController {
  final feedProvider = Get.put(FeedProvider());
  final RxList<FeedModel> feedList = <FeedModel>[].obs;
  final Rx<FeedModel?> currentFeed = Rx<FeedModel?>(null);

  Future<void> vote(int feedId, String choice) async {
    try {
      Map response = await feedProvider.vote(feedId, choice);
      if (response['result'] == 'ok') {
        await feedShow(feedId);
      } else {
        // Get.snackbar('투표 에러', response['message'], snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      // Get.snackbar('투표 에러', e.toString(), snackPosition: SnackPosition.BOTTOM);

    }

  }

  Future<void> feedIndex({int page = 1}) async {
    Map json = await feedProvider.index(page);
    List<FeedModel> tmp =
        json['data'].map<FeedModel>((m) => FeedModel.parse(m)).toList();
    (page == 1) ? feedList.assignAll(tmp) : feedList.addAll(tmp);
  }

  Future<bool> feedCreate(String title, String content, String firstOption,
      String secondOption, String keyword) async {
    Map body = await feedProvider.store(
        title, content, firstOption, secondOption, keyword);

    if (body['result'] == 'ok') {
      await feedIndex();
      return true;
    }
    Get.snackbar('생성 에러', body['message'], snackPosition: SnackPosition.BOTTOM);
    return false;
  }

  Future<void> feedShow(int id) async {
    Map body = await feedProvider.show(id);
    if (body['result'] == 'ok') {
      currentFeed.value = FeedModel.parse(body['data']);
    } else {
      Get.snackbar('피드 에러', body['message'],
          snackPosition: SnackPosition.BOTTOM);
      currentFeed.value = null;
    }
  }

  Future<bool> feedDelete(int id) async {
    Map body = await feedProvider.destroy(id);
    if (body['result'] == 'ok') {
      feedList.removeWhere((feed) => feed.id == id);
      return true;
    }
    Get.snackbar('삭제 에러', body['message'], snackPosition: SnackPosition.BOTTOM);
    return false;
  }

  feedUpdate(int id, String title, String content, String firstOption,
      String secondOption, int? image) async {
    // price와 image를 적절한 타입으로 변환
    Map body = await feedProvider.update(
        id, title, content, firstOption, secondOption, image);
    if (body['result'] == 'ok') {
      // ID를 기반으로 리스트에서 해당 요소를 찾아 업데이트
      int index = feedList.indexWhere((feed) => feed.id == id);
      if (index != -1) {
        // 찾은 인덱스 위치의 요소를 업데이트
        FeedModel updatedFeed = feedList[index].copyWith(
          title: title,
          firstOption: firstOption,
          content: content,
          imageId: image,
        );
        feedList[index] = updatedFeed; // 특정 인덱스의 요소를 새로운 모델로 교체
      }
      return true;
    }
    Get.snackbar('수정 에러', body['message'], snackPosition: SnackPosition.BOTTOM);
    return false;
  }
}
