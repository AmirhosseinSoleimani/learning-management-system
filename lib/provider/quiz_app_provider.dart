import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/quiz_app_model.dart';
import 'package:http/http.dart' as http;

import '../teacher/quiz_marker/screens/add_questions.dart';

class QuizAppProvider with ChangeNotifier{
  final List<QuizAppModel> _quizAppList = [];

  List<QuizAppModel> get quizAppList{
    return _quizAppList;
  }

  int numQuestion = 1;

  Future <void> addQuizInformation(BuildContext context,QuizAppModel addQuizInformation) async{
    final url = Uri.parse('https://quiz-maker-app-f5e35-default-rtdb.firebaseio.com/quizDataBase.json');
    try{
      final response = await http.post(url,headers: {
        'Content-Type': 'application/json'
      }, body: json.encode({
        'quizTitle': addQuizInformation.quizTitle,
        'quizDescription': addQuizInformation.quizDescription,
        'quizImageUrl': addQuizInformation.quizImageUrl,
        'quizStartCalendar': addQuizInformation.quizStartCalendar,
        'duration': addQuizInformation.duration.toString(),
      }),
      );
      Navigator.pushNamed(context, AddQuestions.routeName);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      final newQuizInformation = QuizAppModel(
        id: json.decode(response.body)['name'],
        quizTitle: addQuizInformation.quizTitle,
        quizDescription: addQuizInformation.quizDescription,
        quizImageUrl: addQuizInformation.quizImageUrl,
        quizStartCalendar: addQuizInformation.quizStartCalendar,
        duration: addQuizInformation.duration,
        questionList: [
            QuestionsList(
              question: '',
              option4: '',
              option1: '',
              option3: '',
              option2: '',
              isSelectOption1: false,
              isSelectOption2: false,
              isSelectOption3: false,
              isSelectOption4: false,
            )
          ],
      );
      _quizAppList.add(newQuizInformation);
      notifyListeners();
    }catch(error){
      debugPrint(error.toString());
    }
  }


  Future <void> addNextQuizQuestions(QuestionsList questionsList,QuizAppModel quizInformation,int numQuestion) async{
    final id = _quizAppList[0].id;
    final url = Uri.parse('https://quiz-maker-app-f5e35-default-rtdb.firebaseio.com/quizDataBase/$id.json');
    try {
      final response = await http.patch(url, headers: {
        'Content-Type': 'application/json'
      }, body: json.encode({
          'question$numQuestion' : {
            'question': questionsList.question,
            'option1': questionsList.option1,
            'option2': questionsList.option2,
            'option3': questionsList.option3,
            'option4': questionsList.option4,
            'isSelectOption1': questionsList.isSelectOption1,
            'isSelectOption2': questionsList.isSelectOption2,
            'isSelectOption3': questionsList.isSelectOption3,
            'isSelectOption4': questionsList.isSelectOption4,
          }
      })
      );
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
    }catch(error){
      debugPrint(error.toString());
    }
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
    );
    _quizAppList[0].questionList.add(addQuestion);
    notifyListeners();
  }
}