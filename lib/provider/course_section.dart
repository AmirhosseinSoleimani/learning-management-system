import 'package:flutter/material.dart';

import '../models/course_section.dart';

class CourseSectionProvider with ChangeNotifier{
  final List<CourseSection> _courseSection = [];

  List<CourseSection> get courseSection{
    return _courseSection;
  }

  void addCourseSectionTitle(String title){
    CourseSection courseSection = CourseSection(
        sectionTitle: title,
        id: DateTime.now().toString());
    _courseSection.add(courseSection);
    notifyListeners();
  }

  void deleteCourseSectionTitle(int index){
    _courseSection.removeAt(index);
    notifyListeners();
  }

  void editCourseSectionTitle(String id,String title){
    final editCourseSection = _courseSection.indexWhere((element) => element.id == id);
    // _courseSection.removeAt(index);
    notifyListeners();
  }

}