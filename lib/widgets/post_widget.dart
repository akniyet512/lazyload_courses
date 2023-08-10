
import 'package:flutter/material.dart';
import 'package:lazyload_courses/providers/my_home_widget_provider.dart';
import 'package:lazyload_courses/widgets/posts_row_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: MyHomeWidgetProvider.watch(context)?.model.posts.length ?? 0,
      itemBuilder: (context, index) {
        return PostsRowWidget(index: index);
      },
    );
  }
}
