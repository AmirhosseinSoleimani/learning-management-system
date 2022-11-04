import 'package:flutter/material.dart';
import 'package:learning_management_system/provider/quiz_app_provider.dart';
import 'package:learning_management_system/teacher/quiz_marker/screens/create_quiz.dart';
import 'package:learning_management_system/teacher/quiz_marker/widgets/quiz_item.dart';
import 'package:provider/provider.dart';


class QuizMarker extends StatefulWidget {
  static const routeName = '/quiz_marker';
  const QuizMarker({Key? key}) : super(key: key);

  @override
  State<QuizMarker> createState() => _QuizMarkerState();
}

class _QuizMarkerState extends State<QuizMarker> {

  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<QuizAppProvider>(context,listen: false).getDataInformation();
    Future.delayed(const Duration(seconds: 3),(){
      setState((){_isLoading = false;});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) :Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              getQuizMarker(context),
            ],
          )
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
    final quizApp = Provider.of<QuizAppProvider>(context,listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children:
        List.generate(
          quizApp.quizAppList.length, (index) => Container(
          padding: const EdgeInsets.only(left: 15.0),
          margin: const EdgeInsets.only(right: 15.0,bottom: 5.0),
          child: QuizItem(
            quizTitle: quizApp.quizAppList[index].quizTitle,
            quizDescription: quizApp.quizAppList[index].quizDescription,
            duration: quizApp.quizAppList[index].duration,
            quizImageUrl: quizApp.quizAppList[index].quizImageUrl,
            quizStartCalendar: quizApp.quizAppList[index].quizStartCalendar,

          ),
        )
        ),
      ),
    );
  }
}



