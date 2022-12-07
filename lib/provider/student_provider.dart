import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_management_system/models/student_signUp_model.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import 'package:http/http.dart' as http;

class StudentProvider with ChangeNotifier{
  final List<StudentSignUpPost> _studentAccountPost = [];


  List<StudentSignUpPost> get studentAccountPost{
    return _studentAccountPost;
  }

  final List<StudentSignUpPatch> _studentAccountPatch = [];

  List<StudentSignUpPatch> get studentAccountPatch{
    return _studentAccountPatch;
  }

  String userNameError = '';

  String id = '';

  String? phoneNumberTextFormField;

  bool isLocation = false;
  double defaultLatitude = 35.715298;
  double defaultLongitude = 51.404343;

  List<String> favouriteCourseList = [];

  goNext(BuildContext context,String routes){
    Navigator.of(context).pushReplacementNamed(routes);
  }


  Future <void> studentSignUpPost(BuildContext context,StudentSignUpPost studentSignUp) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/student/');
    try{
      http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode(
            {
              'user_name': studentSignUp.userName,
              'password': studentSignUp.password,
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
        goNext(context,Routes.studentInformation);
      }
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
      debugPrint(id);


      final newStudentSignUpPost = StudentSignUpPost(
        userName: studentSignUp.userName,
        password: studentSignUp.password,
      );
      studentAccountPost.add(newStudentSignUpPost);
      notifyListeners();
    }
    catch(error){
      debugPrint(error.toString());
    }
  }

  Future <void> replaceStudentSignUp(BuildContext context,StudentSignUpPatch studentSignUpPatch) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/');
    try{
      http.Response response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json'
        },
        body: json.encode(
            {
              'first_name': studentSignUpPatch.firstName,
              'last_name': studentSignUpPatch.lastName,
              'email': studentSignUpPatch.email,
              "gender": studentSignUpPatch.gender,
              'country': "united states",
              'introduction': "too hard",
              'birth_day': 21312312,
              'id': id,
              "address": 'home sweet home',
              "bio": studentSignUpPatch.bio,
              "card_number": null,
              "language": null,
              "latitude": null,
              "longitude": null,
              "phone_number": "+989124182872",
              "work_history": null
            }
        ),
      );
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if(response.body.contains('this username is exist, try another')){
        userNameError = 'This User Name is Exit';
      }else if(response.statusCode == 200){
        goNext(context,Routes.studentSecondInformation);
        isLocation = false;
      }
      final newStudentSignUpPatch = StudentSignUpPatch(
        email: studentSignUpPatch.email,
        firstName: studentSignUpPatch.firstName,
        lastName: studentSignUpPatch.lastName,
        gender: studentSignUpPatch.gender,
        bio: studentSignUpPatch.bio,
        id: id,
        country: '',
        introduction: '',
        birthDay: 123456,
      );
      _studentAccountPatch.add(newStudentSignUpPatch);
      notifyListeners();
    }catch(error){
      debugPrint(error.toString());
    }
  }

  Future <void> replaceSecondStudentSignUp(BuildContext context,StudentSignUpPatch studentSignUpPatch) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/');
    try{
      http.Response response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json'
        },
        body: json.encode(
            {
              'first_name': studentAccountPatch[0].firstName,
              'last_name': studentAccountPatch[0].lastName,
              'email': studentAccountPatch[0].email,
              "gender": studentAccountPatch[0].gender,
              'country': studentSignUpPatch.country,
              'introduction': studentSignUpPatch.introduction,
              'birth_day': studentSignUpPatch.birthDay,
              'id': id,
              "address": 'home sweet home',
              "bio": studentAccountPatch[0].bio,
              "card_number": null,
              "language": null,
              "latitude": null,
              "longitude": null,
              "phone_number": studentSignUpPatch.phoneNumber,
              "work_history": null
            }
        ),
      );
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if(response.body.contains('this username is exist, try another')){
        userNameError = 'This User Name is Exit';
      }else if(response.statusCode == 200){
        goNext(context,Routes.studentFavourite);
        isLocation = false;
      }
      final newStudentSignUpPatch = StudentSignUpPatch(
        email: studentAccountPatch[0].email,
        firstName: studentAccountPatch[0].firstName,
        lastName: studentAccountPatch[0].lastName,
        gender: studentAccountPatch[0].gender,
        bio: studentAccountPatch[0].bio,
        id: id,
        country: studentSignUpPatch.country,
        introduction: studentSignUpPatch.introduction,
        birthDay: studentSignUpPatch.birthDay,
        phoneNumber: '+9383202865'
      );
      _studentAccountPatch.removeAt(0);
      _studentAccountPatch.add(newStudentSignUpPatch);
      notifyListeners();
    }catch(error){
      debugPrint(error.toString());
    }
  }

}


