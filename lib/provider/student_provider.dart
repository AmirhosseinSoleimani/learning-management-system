import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_management_system/extension/extension.dart';
import '../authentication/sign_up/student/student_information.dart';
import '../models/student_account.dart';
import 'package:http/http.dart' as http;

class StudentProvider with ChangeNotifier{
  final List<StudentAccount> _studentAccount = [];


  List<StudentAccount> get studentAccount{
    return _studentAccount;
  }

  String userNameError = '';

  String? phoneNumberTextFormField;

  List<String> favouriteCourseList = [];


  Future <void> addStudentAccount(BuildContext context,StudentAccount studentAccount) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/student/');
      try{
        http.Response response = await http.post(url,
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
                "gender": 1,
                'bio': studentAccount.bio,
                'country': studentAccount.country,
                'how_to_know_us': studentAccount.introduction,
                'birthday': studentAccount.birthdayDate,
                'favouriteCourse': studentAccount.favouriteCourse,
              }
          ),
        );
        if(response.body.contains('this username is exist, try another')){
          userNameError = 'This User Name is Exit';
        }else{
          Navigator.pushNamed(context, InformationStudentSignUp.routeName);
        }
        debugPrint(response.statusCode.toString());
        debugPrint(response.body.toString());
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
          birthdayDate: studentAccount.birthdayDate,
          favouriteCourse: studentAccount.favouriteCourse,
          userName: studentAccount.userName,
        );
        _studentAccount.add(newStudentAccount);
        notifyListeners();
      }catch(error){
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
              'birthday': studentAccount.birthdayDate,
              'favouriteCourse': studentAccount.favouriteCourse,
            }
        ),
      );
      if(response.body.contains('this username is exist, try another')){
        userNameError = 'This User Name is Exit';
      }else{
        Navigator.pushNamed(context, InformationStudentSignUp.routeName);
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
        birthdayDate: studentAccount.birthdayDate,
        favouriteCourse: studentAccount.favouriteCourse,
        userName: studentAccount.userName,
      );
      _studentAccount.removeAt(0);
      _studentAccount.add(newStudentAccount);
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
          'birthday': studentAccount.birthdayDate,
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


