
class QuestionsList{
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  bool isSelectOption1;
  bool isSelectOption2;
  bool isSelectOption3;
  bool isSelectOption4;
  final DateTime dateTime;

  QuestionsList({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    this.isSelectOption1 = false,
    this.isSelectOption2 = false,
    this.isSelectOption3 = false,
    this.isSelectOption4 = false,
    required this.dateTime,

});
}


class QuizAppModel{
  final String id;
   final String quizTitle;
   final String quizDescription;
   final String quizImageUrl;
   final String quizStartCalendar;
   final DateTime duration;
   final List<QuestionsList> questionList;
   QuizAppModel({
     required this.id,
     required this.quizTitle,
     required this.quizStartCalendar,
     required this.duration,
     required this.quizDescription,
     required this.quizImageUrl,
     required this.questionList
});
}