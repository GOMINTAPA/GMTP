
import 'package:get/get.dart';
import 'package:gomintapa/src/providers/provider.dart';

class FeedProvider extends Provider {
  Future<Map> index([int page = 1]) async {
    Response response = await get(
      '/api/feed',
      query: {'page': '$page'},
    );
    
    return response.body;
  }

  Future<Map> store(
      String title, String content, String firstOption, String secondOption) async {
    final Map<String, dynamic> body = {
      'title': title,
      'content': content,
      'first_option': firstOption,
      'second_option': secondOption
    };

    // if (image != null) {
    //   body['image'] = image.toString();
    // }

    final response = await post('/api/feed', body);
    return response.body;
  }

  Future<Map> update(
    int id,
    String title,
    String price,
    String content,
    int? image,
  ) async {
    final Map<String, dynamic> body = {
      'title': title,
      'price': price,
      'content': content,
    };
    if (image != null) {
      body['image'] = image.toString();
    }
    final response = await put('/api/feed/$id', body);
    return response.body;
  }

  Future<Map> show(int id) async {
    final response = await get('/api/feed/$id');
    return response.body;
  }

  Future<Map> destroy(int id) async {
    final response = await delete('/api/feed/$id');
    return response.body;
  }
}
