import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_up/student/second_student_information.dart';
import '../models/student_account.dart';
import 'package:http/http.dart' as http;
import '../models/teacher_signUp_post_model.dart';

class TeacherProvider with ChangeNotifier{
  final List<TeacherSignUpPost> _teacherAccountPost = [];


  List<TeacherSignUpPost> get teacherAccountPost{
    return _teacherAccountPost;
  }

  String userNameError = '';

  String? phoneNumberTextFormField;

  List<String> favouriteCourseList = [];


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
        print(userNameError);
      }else{

      }
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
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

  Future <void> replaceStudentAccount(BuildContext context,StudentAccount studentAccount) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/student/');
    try{
      http.Response response = await http.put(url,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode(
            {
              'user_name': studentAccount.userName,
              'first_name': studentAccount.firstName,
              'last_name': studentAccount.lastName,
              'password': studentAccount.password,
              'email': studentAccount.email,
              'phone_number': studentAccount.phoneNumber,
              "gender": studentAccount.gender,
              'bio': studentAccount.bio,
              'country': studentAccount.country,
              'how_to_know_us': studentAccount.introduction,
              'birthday': studentAccount.birthDay,
              'favouriteCourse': studentAccount.favouriteCourse,
            }
        ),
      );
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if(response.body.contains('this username is exist, try another')){
        userNameError = 'This User Name is Exit';
      }else{
        Navigator.pushNamed(context, SecondInformationStudent.routeName);
      }
      final newStudentAccount = StudentAccount(
        password: studentAccount.password,
        email: studentAccount.email,
        firstName: studentAccount.firstName,
        lastName: studentAccount.lastName,
        phoneNumber: studentAccount.phoneNumber,
        gender: studentAccount.gender,
        bio: studentAccount.bio,
        country: studentAccount.country,
        introduction: studentAccount.introduction,
        birthDay: studentAccount.birthDay,
        favouriteCourse: studentAccount.favouriteCourse,
        userName: studentAccount.userName,
      );
      // _studentAccount.removeAt(0);
      // _studentAccount.add(newStudentAccount);
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


