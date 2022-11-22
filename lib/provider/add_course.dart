import 'package:flutter/material.dart';

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
}