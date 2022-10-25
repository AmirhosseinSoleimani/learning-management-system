import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/student_account.dart';
import 'package:http/http.dart' as http;

class StudentProvider with ChangeNotifier{
  final List<StudentAccount> _studentAccount = [];


  List<StudentAccount> get studentAccount{
    return _studentAccount;
  }


  Future <void> addStudentAccount(StudentAccount studentAccount) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/auth/sign-up/student');
    try{
      await http.post(url,body: json.encode(
        {
          'password': studentAccount.password,
          'email': studentAccount.email,
          'firstName': studentAccount.firstName,
          'lastName': studentAccount.lastName,
          'phoneNumber': studentAccount.phoneNumber,
          'gender': studentAccount.gender,
          'bio': studentAccount.bio,
          'country': studentAccount.country,
          'introduction': studentAccount.introduction,
          'birthdayDate': studentAccount.birthdayDate,
          'favouriteCourse': studentAccount.favouriteCourse,
        }
      ));
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
        birthdayDate: DateTime.now(),
        favouriteCourse: [],
      );
      _studentAccount.add(newStudentAccount);
      notifyListeners();
    }catch(e){
      debugPrint(e.toString());
    }
  }


}