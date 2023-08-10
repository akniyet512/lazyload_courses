import 'package:flutter/material.dart';
import 'package:lazyload_courses/services/api_client.dart';
import 'package:lazyload_courses/models/post_model.dart';

class MyHomeWidgetNotifier extends ChangeNotifier {
  List<PostModel> _posts = [];

  List<PostModel> get posts => _posts;

  Future<void> reloadPosts() async {
    final List<PostModel> posts = await ApiClient().getPosts();
    _posts += posts;
    notifyListeners();
  }

  Future<void> createPost() async {
    final PostModel post = await ApiClient().createPost(
      title: "title",
      body: "body",
    );
    _posts.add(post);
    notifyListeners();
  }
}
