import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_management_system/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../models/lesson_model.dart';
import '../models/section_model.dart';
import '../models/signIn_model.dart';
import 'add_courses_provider.dart';

UserInformation userInformation(BuildContext context){
  UserInformation userInformation = Provider.of<SignInProvider>(context,listen: false).userInformation[0];
  return userInformation;
}

String courseId(BuildContext context){
  String courseID = Provider.of<AddCourseProvider>(context,listen: false).id;
  return courseID;
}

class LessonProvider with ChangeNotifier{
  final List<LessonModel> _lesson = [];
  List<LessonModel> get lesson{
    return _lesson;
  }

  Future<void> addLessonTitle(BuildContext context,String lessonTitle) async{
    // final url = Uri.parse('http://135.125.59.77:8090/api/v1/courses/add-section/');
    // String token = userInformation(context).token;
    // try {
    //   http.Response response = await http.post(url,
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Authorization': 'Bearer $token',
    //       'accept': 'application/json',
    //     },
    //     body: json.encode(
    //         {
    //           "Section_name": sectionTitle,
    //           "course_id": courseId(context),
    //         }
    //     ),
    //   );
    //   if(response.statusCode == 200){
        // final data = jsonDecode(response.body);
        LessonModel lesson = LessonModel(
            lessonName: lessonTitle,
            id: DateTime.now().toString()
        );
        _lesson.add(lesson);
        notifyListeners();
      // }
      // debugPrint(response.statusCode.toString());
      // debugPrint(response.body);
    // }catch(error){
    //   debugPrint(error.toString());
    // }
  }
}