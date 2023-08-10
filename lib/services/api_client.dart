import 'dart:convert';
import 'dart:io';

import 'package:lazyload_courses/models/post_model.dart';

class ApiClient {
  final HttpClient client = HttpClient();

  Future<List<PostModel>> getPosts() async {
    final List<dynamic> jsonList =
        await get("https://jsonplaceholder.typicode.com/posts");
    final List<PostModel> posts = jsonList
        .map((dynamic element) =>
            PostModel.fromJson(element as Map<String, dynamic>))
        .toList();
    return posts;
  }

  Future<PostModel> createPost({
    required String title,
    required String body,
  }) async {
    final Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final HttpClientRequest request = await client.postUrl(uri);
    final Map<String, dynamic> parameters = {
      "title": title,
      "body": body,
      "userId": 109,
    };
    request.headers.set("Content-type", "application/json; charset=UTF-8");
    request.write(jsonEncode(parameters));
    final HttpClientResponse response = await request.close();
    final List<String> jsonStrings =
        await response.transform(utf8.decoder).toList();
    final String jsonString = jsonStrings.join();
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return PostModel.fromJson(json);
  }

  Future<dynamic> get(String url) async {
    final Uri uri = Uri.parse(url);
    final HttpClientRequest request = await client.getUrl(uri);
    final HttpClientResponse response = await request.close();
    final List<String> jsonStrings =
        await response.transform(utf8.decoder).toList();
    final String jsonString = jsonStrings.join();
    final dynamic jsonList = json.decode(jsonString);
    return jsonList;
  }
}
