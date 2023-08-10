import 'package:flutter/material.dart';
import 'package:lazyload_courses/notifiers/my_home_widget_notifier.dart';
import 'package:lazyload_courses/providers/my_home_widget_provider.dart';
import 'package:lazyload_courses/widgets/create_button.dart';
import 'package:lazyload_courses/widgets/post_widget.dart';
import 'package:lazyload_courses/widgets/reload_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyHomeWidgetNotifier model = MyHomeWidgetNotifier();
    return Scaffold(
      body: SafeArea(
        child: MyHomeWidgetProvider(
          model: model,
          child: const Column(
            children: [
              ReloadButton(),
              CreateButton(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: PostWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
