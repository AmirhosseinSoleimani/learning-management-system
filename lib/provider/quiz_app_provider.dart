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
    // final newQuizInformation = QuizAppModel(
    //     id:addQuizInformation.id,
    //     quizTitle: addQuizInformation.quizTitle,
    //     quizDescription: addQuizInformation.quizDescription,
    //     quizImageUrl: addQuizInformation.quizImageUrl,
    //     quizStartCalendar: addQuizInformation.quizStartCalendar,
    //     duration: addQuizInformation.duration,
    //     questionList: []
    // );
    // _quizAppList.add(newQuizInformation);
    // notifyListeners();

  }

  Future <void> addQuizQuestions(QuestionsList questionsList) async{
    final addQuestion = QuestionsList(
      question: questionsList.question,
      option1: questionsList.option1,
      option2: questionsList.option2,
      option3: questionsList.option3,
      option4: questionsList.option4,
      isSelectOption1: questionsList.isSelectOption1,
      isSelectOption2: questionsList.isSelectOption2,
      isSelectOption3: questionsList.isSelectOption3,
      isSelectOption4: questionsList.isSelectOption4,
      dateTime: questionsList.dateTime
    );
    _quizAppList[0].questionList.add(addQuestion);
    notifyListeners();

  }


}