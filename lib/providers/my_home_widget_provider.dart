import 'package:flutter/material.dart';
import 'package:lazyload_courses/notifiers/my_home_widget_notifier.dart';

class MyHomeWidgetProvider extends InheritedNotifier {
  final MyHomeWidgetNotifier model;

  const MyHomeWidgetProvider({
    super.key,
    required Widget child,
    required this.model,
  }) : super(
          child: child,
          notifier: model,
        );

  static MyHomeWidgetProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyHomeWidgetProvider>();
  }

  static MyHomeWidgetProvider? read(BuildContext context) {
    final Widget? widget = context
        .getElementForInheritedWidgetOfExactType<MyHomeWidgetProvider>()
        ?.widget;
    return widget is MyHomeWidgetProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant MyHomeWidgetProvider oldWidget) {
    return true;
  }
}
