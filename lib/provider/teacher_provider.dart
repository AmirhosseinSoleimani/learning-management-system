import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import 'package:http/http.dart' as http;
import '../models/teacher_signUp_model.dart';
import 'package:geolocator/geolocator.dart';

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

  String? address;

  bool isLocation = false;
  double defaultLatitude = 35.715298;
  double defaultLongitude = 51.404343;

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
        final data = jsonDecode(response.body);
        var dataId = data["data"]["id"];
        id = dataId;
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
        isLocation = false;
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

  Future<void> selectedLocation(BuildContext context,Position position) async{

    defaultLatitude = position.latitude;
    defaultLongitude = position.longitude;
    goNext(context,Routes.teacherInformationSecondRoutes);
    isLocation = true;
  }

  Future <void> replaceTeacherSecondSignUp(BuildContext context,TeacherSignUpPatch teacherSignUpPatch) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/');
    try{
      http.Response response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json'
        },
        body: json.encode(
            {
              'first_name': _teacherAccountPatch[0].firstName,
              'last_name': _teacherAccountPatch[0].lastName,
              'email': _teacherAccountPatch[0].email,
              "gender": _teacherAccountPatch[0].gender,
              'country': _teacherAccountPatch[0].country,
              'introduction': _teacherAccountPatch[0].introduction,
              'birth_day': _teacherAccountPatch[0].birthDay,
              'id': id,
              "address": teacherSignUpPatch.address,
              "bio": "hello this is iliya",
              "card_number": teacherSignUpPatch.cardNumber,
              "language": "fucking persian",
              "latitude": defaultLatitude,
              "longitude": defaultLongitude,
              "phone_number": '+9383202865',
              "work_history": "working on fucking stack team"
            }
        ),
      );
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if(response.body.contains('this username is exist, try another')){
        userNameError = 'This User Name is Exit';
      }else if(response.statusCode == 200){
        goNext(context,Routes.teacherInformationThirdRoutes);
        isLocation = false;
      }
      final newTeacherSignUpPatch = TeacherSignUpPatch(
        email: _teacherAccountPatch[0].email,
        firstName: _teacherAccountPatch[0].firstName,
        lastName: _teacherAccountPatch[0].lastName,
        gender: _teacherAccountPatch[0].gender,
        country: _teacherAccountPatch[0].country,
        introduction: _teacherAccountPatch[0].introduction,
        birthDay: _teacherAccountPatch[0].birthDay,
        address: teacherSignUpPatch.address,
        latitude: defaultLatitude,
        longitude: defaultLongitude,
        financial: teacherSignUpPatch.financial,
        phoneNumber: teacherSignUpPatch.phoneNumber,
        cardNumber: teacherSignUpPatch.cardNumber,
      );
      _teacherAccountPatch.removeAt(0);
      _teacherAccountPatch.add(newTeacherSignUpPatch);
      notifyListeners();
    }catch(error){
      debugPrint(error.toString());
    }
  }

  Future <void> replaceTeacherThirdSignUp(BuildContext context,TeacherSignUpPatch teacherSignUpPatch) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/sign-up/');
    try{
      http.Response response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json'
        },
        body: json.encode(
            {
              'first_name': _teacherAccountPatch[0].firstName,
              'last_name': _teacherAccountPatch[0].lastName,
              'email': _teacherAccountPatch[0].email,
              "gender": _teacherAccountPatch[0].gender,
              'country': _teacherAccountPatch[0].country,
              'introduction': _teacherAccountPatch[0].introduction,
              'birth_day': _teacherAccountPatch[0].birthDay,
              'id': id,
              "address": address,
              "bio": teacherSignUpPatch.bio,
              "card_number": _teacherAccountPatch[0].cardNumber,
              "language": "fucking persian",
              "latitude": defaultLatitude,
              "longitude": defaultLongitude,
              "phone_number": '+$phoneNumberTextFormField',
              "work_history": "working on fucking stack team"
            }
        ),
      );
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if(response.body.contains('this username is exist, try another')){
        userNameError = 'This User Name is Exit';
      }else if(response.statusCode == 200){
        goNext(context,Routes.teacherFavouriteRoutes);
        isLocation = false;
      }
      final newTeacherSignUpPatch = TeacherSignUpPatch(
        email: _teacherAccountPatch[0].email,
        firstName: _teacherAccountPatch[0].firstName,
        lastName: _teacherAccountPatch[0].lastName,
        gender: _teacherAccountPatch[0].gender,
        country: _teacherAccountPatch[0].country,
        introduction: _teacherAccountPatch[0].introduction,
        birthDay: _teacherAccountPatch[0].birthDay,
        address: _teacherAccountPatch[0].address,
        latitude: defaultLatitude,
        longitude: defaultLongitude,
        financial: _teacherAccountPatch[0].financial,
        phoneNumber: _teacherAccountPatch[0].phoneNumber,
        cardNumber: _teacherAccountPatch[0].cardNumber,
        bio: teacherSignUpPatch.bio,
      );
      _teacherAccountPatch.removeAt(0);
      _teacherAccountPatch.add(newTeacherSignUpPatch);
      notifyListeners();
    }catch(error){
      debugPrint(error.toString());
    }
  }

}


