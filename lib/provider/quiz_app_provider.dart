import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/quiz_app_model.dart';
import 'package:http/http.dart' as http;

class QuizAppProvider with ChangeNotifier{
  final List<QuizAppModel> _quizAppList = [];

  List<QuizAppModel> get quizAppList{
    return _quizAppList;
  }

  Future <void> addQuizInformation(QuizAppModel addQuizInformation) async{
    // final url = Uri.parse('https://lms-user-account-default-rtdb.europe-west1.firebasedatabase.app/authentication.json');
    // try{
    //   final response = await http.post(url, body: json.encode({
    //     'quizTitle': addQuizInformation.quizTitle,
    //     'quizDescription': addQuizInformation.quizDescription,
    //     'quizImageUrl': addQuizInformation.quizImageUrl,
    //   })
    //   );
    //   final newQuizInformation = QuizAppModel(
    //     id: json.decode(response.body)['name'],
    //     quizTitle: addQuizInformation.quizTitle,
    //     quizDescription: addQuizInformation.quizDescription,
    //     quizImageUrl: addQuizInformation.quizImageUrl
    //   );
    //   _quizAppList.add(newQuizInformation);
    //   notifyListeners();
    // }catch(error){
    //   throw(error);
    // }
    final newQuizInformation = QuizAppModel(
        id:addQuizInformation.id,
        quizTitle: addQuizInformation.quizTitle,
        quizDescription: addQuizInformation.quizDescription,
        quizImageUrl: addQuizInformation.quizImageUrl,
        questionList: []
    );
    _quizAppList.add(newQuizInformation);
    print(_quizAppList[0].quizTitle);
    notifyListeners();

  }

}