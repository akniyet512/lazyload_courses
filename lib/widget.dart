import 'package:flutter/material.dart';
import 'package:lazyload_courses/course_data.dart';
import 'package:lazyload_courses/project_images.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.school_rounded),
        Text(' LearnApp'),
      ],
    );
  }
}

class MenuTextButton extends StatelessWidget {
  final String text;
  const MenuTextButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Image(
          width: 800,
          color: Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
          image: AssetImage(ProjectImages.headerImage),
        ),
        Text(
          "Our Courses",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ResponsiveValue<double>(
              context,
              conditionalValues: [
                Condition.smallerThan(
                  name: MOBILE,
                  value: 40,
                ),
                Condition.largerThan(
                  name: TABLET,
                  value: 80,
                ),
              ],
              defaultValue: 60.0,
            ).value,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class CourseTile extends StatelessWidget {
  final Course course;

  const CourseTile({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        color: Colors.blueGrey[50],
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image.asset(course.image),
              const SizedBox(height: 5),
              Text(
                course.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                course.time,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                course.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscribeBlock extends StatelessWidget {
  const SubscribeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Want to learn more?\nSubscribe to our newsletter!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 20,
              ),
            ),
            onPressed: () {},
            child: const Text('SUBSCRIBE'),
          ),
        )
      ],
    );
  }
}