import 'package:flutter/material.dart';
import 'package:lazyload_courses/view_model/example_view_model.dart';
import 'package:lazyload_courses/view/example_widget.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ExampleWidget(model: ExamplePetViewModel()),
    );
  }
}
