import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import '../models/student_account.dart';
import 'package:http/http.dart' as http;
import '../models/teacher_signUp_model.dart';

class TeacherProvider with ChangeNotifier{
  final List<TeacherSignUpPost> _teacherAccountPost = [];


  List<TeacherSignUpPost> get teacherAccountPost{
    return _teacherAccountPost;
  }

  final List<TeacherSignUpPatch> _teacherAccountPatch = [];

  List<TeacherSignUpPatch> get teacherAccountPatch{
    return _teacherAccountPatch;
  }

  String userNameError = '';

  String id = '';

  String? phoneNumberTextFormField;

  List<String> favouriteCourseList = [];

  goNext(BuildContext context,String routes){
    Navigator.of(context).pushReplacementNamed(routes);
  }


  Future <void> teacherSignUpPost(BuildContext context,TeacherSignUpPost teacherSignUpPost) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/teacher/');
    try{
      http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode(
            {
              'user_name': teacherSignUpPost.userName,
              'password': teacherSignUpPost.password,
            }
        ),
      );
      if(response.body.contains('this username is exist, try another')){
        userNameError = 'This User Name is Exit';
        notifyListeners();
      }
      else if(response.statusCode == 200){
        String data = response.body;
        id = data.substring(14,52);
        goNext(context,Routes.teacherInformationRoutes);
      }
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
      debugPrint(id);


      final newTeacherSignUpPost = TeacherSignUpPost(
        password: teacherSignUpPost.password,
        userName: teacherSignUpPost.userName,
      );
      teacherAccountPost.add(newTeacherSignUpPost);
      notifyListeners();
    }
    catch(error){
      debugPrint(error.toString());
    }
  }

  Future <void> replaceTeacherSignUp(BuildContext context,TeacherSignUpPatch teacherSignUpPatch) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/');
    try{
      http.Response response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json'
        },
        body: json.encode(
            {
              'first_name': teacherSignUpPatch.firstName,
              'last_name': teacherSignUpPatch.lastName,
              'email': teacherSignUpPatch.email,
              "gender": teacherSignUpPatch.gender,
              'country': teacherSignUpPatch.country,
              'introduction': teacherSignUpPatch.introduction,
              'birth_day': teacherSignUpPatch.birthDay,
              'id': id,
              "address": "home sweet home",
              "bio": "hello this is iliya",
              "card_number": 5047061042077269,
              "language": "fucking persian",
              "latitude": 12321.41214,
              "longitude": 1221.4124,
              "phone_number": "+989124182872",
              "work_history": "working on fucking stack team"
            }
        ),
      );
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if(response.body.contains('this username is exist, try another')){
        userNameError = 'This User Name is Exit';
      }else if(response.statusCode == 200){
        goNext(context,Routes.teacherInformationSecondRoutes);
      }
      final newTeacherSignUpPatch = TeacherSignUpPatch(
        email: teacherSignUpPatch.email,
        firstName: teacherSignUpPatch.firstName,
        lastName: teacherSignUpPatch.lastName,
        gender: teacherSignUpPatch.gender,
        country: teacherSignUpPatch.country,
        introduction: teacherSignUpPatch.introduction,
        birthDay: teacherSignUpPatch.birthDay,
      );
      _teacherAccountPatch.add(newTeacherSignUpPatch);
      notifyListeners();
    }catch(error){
      debugPrint(error.toString());
    }
  }

  Future<void> postData(StudentAccount studentAccount) async {
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/student/');
    http.Response response = await http.post(url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode(
          {
            "user_name":'${studentAccount.firstName}1234',
            'first_name': studentAccount.firstName,
            'last_name': studentAccount.lastName,
            'password': studentAccount.password,
            'email': studentAccount.email,
            'phone_number': '+${studentAccount.phoneNumber}',
            'gender': studentAccount.gender,
            'bio': studentAccount.bio,
            'country': studentAccount.country,
            'how_to_know_us': studentAccount.introduction,
            'birthday': studentAccount.birthDay,
            'favouriteCourse': studentAccount.favouriteCourse,
          }
      ),
    );
    if(response.statusCode >= 200 && response.statusCode < 400){
      print(response.body);
    }else if(response.statusCode >= 400 && response.statusCode < 500){
      print(response.statusCode);
    }else{
      print(response.statusCode);
    }
  }


}


