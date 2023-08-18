import 'package:flutter/material.dart';
import 'package:lazyload_courses/course_data.dart';
import 'package:lazyload_courses/widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> courses = Course.courses;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[800],
        centerTitle: true,
        title: const AppBarTitle(),
        leading: ResponsiveVisibility(
          hiddenConditions: [
            Condition.largerThan(name: TABLET, value: null),
          ],
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
          ResponsiveVisibility(
            visible: false,
            visibleConditions: [
              Condition.largerThan(name: TABLET, value: null),
            ],
            child: const MenuTextButton(text: "Courses"),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleConditions: [
              Condition.largerThan(name: TABLET, value: null),
            ],
            child: const MenuTextButton(text: "About"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mark_email_unread_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Center(child: PageHeader()),
          const SizedBox(height: 30),
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowPadding: const EdgeInsets.all(30),
            columnPadding: const EdgeInsets.all(30),
            layout: ResponsiveBreakpoints.of(context).isDesktop
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CourseTile(course: courses[0]),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CourseTile(course: courses[1]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Center(child: SubscribeBlock()),
        ],
      ),
    );
  }
}
