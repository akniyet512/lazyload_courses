import 'package:lazyload_courses/project_images.dart';

class Course {
  static final List<Course> courses = [
    Course(
      title: "Dart for Beginners",
      image: ProjectImages.dartCourse,
      time: "23H 17M",
      description: "Beginner course focused on Dart basics.",
    ),
    Course(
      title: "Clean UI Course",
      image: ProjectImages.ui,
      time: "18H 29M",
      description: "Create beautiful user interface.",
    ),
  ];
  final String title;
  final String image;
  final String time;
  final String description;

  Course({
    required this.title,
    required this.image,
    required this.time,
    required this.description,
  });
}
