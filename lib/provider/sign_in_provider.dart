import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/signIn_model.dart';

class SignInProvider with ChangeNotifier{

  final List<UserInformation> _userInformation = [];

  List<UserInformation> get userInformation{
    return _userInformation;
  }

  String passwordError = '';

  Future<void> signIn(SignInModel signInModel) async{
    final url = Uri.parse('http://135.125.59.77:8090/api/v1/auth/');
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      },
      body: json.encode(
          {
            "password": signInModel.password,
            "user_name": signInModel.userName,
          }
      ),
    );
    if(response.body.contains('passwords doesn\'t match')){
      passwordError = 'your Password is incorrect';
      notifyListeners();
    }
    else if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      var userInformation = UserInformation(
          userName: data["user_name"],
          firstName: data["first_name"],
          lastName: data["last_name"],
          birthday: data["birthday"],
          country: data["country"],
          longitude: data["location"]["longitude"].toString(),
          latitude: data["location"]["latitude"].toString(),
          token: data["auth"]["access_token"],
          roleNumber: data["role"]["role_number"][0],
      );
      _userInformation.add(userInformation);
      notifyListeners();

    }
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    debugPrint(userInformation[0].token);

  }
}