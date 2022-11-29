import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_management_system/models/add_course.dart';
import 'package:http/http.dart' as http;
import '../data.dart';

class AddCourseProvider with ChangeNotifier{

  final List<String> _learnThings = [];

  List<String> get learnThings{
    return _learnThings;
  }

  final List<CategoryModel> _categoryModel = [
  ];

  List<CategoryModel> get categoryModel{
    return _categoryModel;
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

  Future<void> addCourseName() async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/courses/add-course/');
    http.Response response = await http.post(
        url,
        headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NfdXVpZCI6ImExYTU3Nzc0LWYwZTQtNDdhNy1hMjE5LTdkZmYzYTA5NzVkOCIsImF1dGhvcml6ZWQiOnRydWUsImV4cCI6MTY2OTc1NzM4OCwidXNlcklkIjoiOTNlYTQ0ZDYtOWIxYi00M2FkLTljYjgtZWZlNTE3MjA3MjA4In0.kdS6erzgwwn0AxZPCTT3XYSVuYTlpR4JNnbDXoevsj4',
        'accept': 'application/json'
        },
        body: json.encode(
          {
            'course_name': 'math',
        }
        ),
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
  }
}