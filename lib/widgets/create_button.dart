import 'package:flutter/material.dart';
import 'package:lazyload_courses/providers/my_home_widget_provider.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => MyHomeWidgetProvider.read(context)?.model.createPost(),
      child: const Text(
        "Create post",
      ),
    );
  }
}