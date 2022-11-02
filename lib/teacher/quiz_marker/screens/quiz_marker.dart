import 'package:flutter/material.dart';
import 'package:learning_management_system/provider/quiz_app_provider.dart';
import 'package:learning_management_system/teacher/quiz_marker/screens/create_quiz.dart';
import 'package:learning_management_system/teacher/quiz_marker/widgets/quiz_item.dart';
import 'package:provider/provider.dart';


class QuizMarker extends StatelessWidget {
  static const routeName = '/quiz_marker';
  const QuizMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizApp = Provider.of<QuizAppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Row(
            children: const [
              Text(
                  'Quiz',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              Text(
                'Marker',
                style: TextStyle(
                    color: Colors.blue
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: getQuizMarker(context)
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateQuiz()));
        },
      ),
    );
  }
  Widget getQuizMarker(BuildContext context){
    final quizApp = Provider.of<QuizAppProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children:
        List.generate(
          quizApp.quizAppList.length, (index) => Container(
          padding: const EdgeInsets.only(left: 15.0),
          margin: const EdgeInsets.only(right: 15.0,bottom: 5.0),
          child: QuizItem(
            imageUrl: quizApp.quizAppList[index].quizImageUrl,
              title: quizApp.quizAppList[index].quizTitle,
              time: quizApp.quizAppList[index].duration,
              calendar: quizApp.quizAppList[index].quizStartCalendar,
              description: quizApp.quizAppList[index].quizDescription,
              onTap: (){
                print(quizApp.quizAppList[0].questionList);
             },
          ),
        )
        ),
      ),
    );
  }

}



