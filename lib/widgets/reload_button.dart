
import 'package:flutter/material.dart';
import 'package:lazyload_courses/providers/my_home_widget_provider.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => MyHomeWidgetProvider.read(context)?.model.reloadPosts(),
      child: const Text(
        "Reload posts",
      ),
    );
  }
}