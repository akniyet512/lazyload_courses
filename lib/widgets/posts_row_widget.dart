import 'package:flutter/material.dart';
import 'package:lazyload_courses/providers/my_home_widget_provider.dart';
import 'package:lazyload_courses/models/post_model.dart';

class PostsRowWidget extends StatelessWidget {
  final int index;

  const PostsRowWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final PostModel post =
        MyHomeWidgetProvider.read(context)!.model.posts[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.id.toString()),
        const SizedBox(height: 10),
        Text(post.title),
        const SizedBox(height: 10),
        Text(post.body),
        const SizedBox(height: 40),
      ],
    );
  }
}
