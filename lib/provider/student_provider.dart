import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_management_system/models/general_account.dart';
import '../models/student_account.dart';
import 'package:http/http.dart' as http;

class StudentProvider with ChangeNotifier{
  List<StudentAccount> _studentAccount = [];


  List<StudentAccount> get items{
    return _studentAccount;
  }

  StudentAccount findById(String id){
    return _studentAccount.firstWhere((element) => element.id == id);
  }


  Future<void> addGeneralStudent(GeneralAccount generalAccount) async{
    final url = Uri.parse('https://lms-user-account-default-rtdb.europe-west1.firebasedatabase.app/studentAccount.json');
    try{
      final response = await http.post(url, body: json.encode({
        'firstName': generalAccount.firstName,
        'lastName': generalAccount.lastName,
        'password': generalAccount.password,
        'email': generalAccount.email,
      })
      );
      final newStudentAccount = StudentAccount(
          id: json.decode(response.body)['name'],
          firstName: generalAccount.firstName,
          lastName: generalAccount.lastName,
          password: generalAccount.password,
          email: generalAccount.email,
          phoneNumber: '',
          gender: '',
          dateTime: DateTime.now(),
          country: '',
      );
          _studentAccount.add(newStudentAccount);
          notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}