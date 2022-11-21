import 'package:flutter/material.dart';
import '../models/add_course.dart';

class AddCourseProvider with ChangeNotifier{
  final List<LearnThingModel> _learnThings = [];

  List<LearnThingModel> get learnThings{
    return _learnThings;
  }

  void addLearnThingsList(LearnThingModel learnThingModel){
    learnThings.add(learnThingModel);
    print(learnThings.length);
    notifyListeners();
  }
}