import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_management_system/models/add_course.dart';
import 'package:http/http.dart' as http;
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import 'package:learning_management_system/provider/category_provider.dart';
import 'package:learning_management_system/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import '../models/signIn_model.dart';

String category(BuildContext context){
  String categoryId = Provider.of<CategoryProvider>(context,listen: false).categoryIdSelected;
  return categoryId;
}

UserInformation userInformation(BuildContext context){
  UserInformation userInformation = Provider.of<SignInProvider>(context,listen: false).userInformation[0];
  return userInformation;
}


class AddCourseProvider with ChangeNotifier{

  final List<String> _learnThings = [];

  List<String> get learnThings{
    return _learnThings;
  }

  final List<String> _tag = [];

  List<String> get tag{
    return _tag;
  }

  final List<CategoryModel> _categoryModel = [
  ];

  List<CategoryModel> get categoryModel{
    return _categoryModel;
  }

  final List<UpdateCourse> _updateCourse = [
  ];

  List<UpdateCourse> get updateCourse{
    return _updateCourse;
  }

  String description = '';
  String subTitle = '';
  bool backTitle = false;

  goNext(BuildContext context,String routes){
    Navigator.of(context).pushReplacementNamed(routes);
  }

  String id = '';
  

  Future<void> addCourseTitle(BuildContext context,String title) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/courses/add-course/');
    String token = userInformation(context).token;

    try {
      http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
        },
        body: json.encode(
            {
              'course_name': title,
            }
        ),
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        id = data["id"];
        goNext(context,Routes.addCourseTitle);
        notifyListeners();
      }
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      debugPrint(id);
    }catch(error){
      debugPrint(error.toString());
    }
  }


  Future<void> addLearnThingsList(String learnThingsText) async{
    learnThings.add(learnThingsText);
    notifyListeners();
  }

  Future<void> deleteLearnThingsList(String learnThingsText) async{
    learnThings.remove(learnThingsText);
    notifyListeners();
  }

  Future<void> addTagList(String tag) async{
    _tag.add(tag);
    notifyListeners();
  }

  Future<void> deleteTagList(String tag) async{
    learnThings.remove(tag);
    notifyListeners();
  }

  Future<void> updateCourseFunction(BuildContext context) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/courses/update-course/');
    String token = userInformation(context).token;
    String categoryId = category(context);
    try {
      http.Response response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
        },
        body: json.encode(
            {
              "category": categoryId,
              "description": description,
              "id": id,
              "owner": "",
            }
        ),
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        debugPrint(data);
        goNext(context,Routes.addCoursePricing);
        notifyListeners();
      }
      debugPrint(response.statusCode.toString());
      debugPrint(id);
    }catch(error){
      debugPrint(error.toString());
    }
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