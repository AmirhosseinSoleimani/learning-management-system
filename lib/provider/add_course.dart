import 'package:flutter/material.dart';

import '../data.dart';

class AddCourseProvider with ChangeNotifier{
  final List<String> _learnThings = [];

  List<String> get learnThings{
    return _learnThings;
  }


  Future<void> addLearnThingsList(String learnThingsText) async{
    learnThings.add(learnThingsText);
    notifyListeners();
  }

  void deleteLearnThingsList(String learnThingsText){
    learnThings.remove(learnThingsText);
    notifyListeners();
  }

  void checkBoxCategory(bool selected,int index){
    bool isSelected = selected;
    courses[index]["isSelected"] = isSelected;
    print(courses[index]["isSelected"]);
    notifyListeners();
  }
}