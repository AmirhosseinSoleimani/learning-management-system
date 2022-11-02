import 'package:flutter/material.dart';
import 'package:learning_management_system/teacher/quiz_marker/screens/quiz_marker.dart';
import '../../../models/quiz_app_model.dart';
import 'package:learning_management_system/provider/quiz_app_provider.dart';
import 'package:provider/provider.dart';

class AddQuestions extends StatefulWidget {
  static const routeName = '/add-question';
  const AddQuestions({Key? key}) : super(key: key);

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> with TickerProviderStateMixin{
  late AnimationController controller;
  final _formKey = GlobalKey<FormState>();
  final _questions = FocusNode();
  final _option1 = FocusNode();
  final _option2 = FocusNode();
  final _option3 = FocusNode();
  final _option4 = FocusNode();
  bool isSelectOption1 = false;
  bool isSelectOption2 = false;
  bool isSelectOption3 = false;
  bool isSelectOption4 = false;
  final question = TextEditingController();
  final option1 = TextEditingController();
  final option2 = TextEditingController();
  final option3 = TextEditingController();
  final option4 = TextEditingController();


  var _question = QuestionsList(
    question: '',
    option1: '',
    option2: '',
    option3: '',
    option4: '',
    isSelectOption1: false,
    isSelectOption2: false,
    isSelectOption3: false,
    isSelectOption4: false,
  );

  var _questionInformation = QuizAppModel(
      id: '',
      quizTitle: '',
      quizStartCalendar: 0,
      duration: DateTime.now(),
      quizDescription: '',
      quizImageUrl: '',
      questionList: [],
  );

  String get countText{
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed?
    '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(controller.duration!.inSeconds % 60).toString().padLeft(2,'0')}'
    :'${(count.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(count.inSeconds % 60).toString().padLeft(2,'0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 60));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void clearText() {
    question.clear();
    option1.clear();
    option2.clear();
    option3.clear();
    option4.clear();
    setState((){
      isSelectOption1 = false;
      isSelectOption2 = false;
      isSelectOption3 = false;
      isSelectOption4 = false;
    });
  }

  bool _isLoading = false;
  int numQuestion = 1;

  Future<void> _saveFormNextQuestion() async{
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return ;
    }
    _formKey.currentState!.save();
    setState((){
      _isLoading = true;
    });
    final quizInformation = Provider.of<QuizAppProvider>(context,listen: false);
    _questionInformation = QuizAppModel(
      id: quizInformation.quizAppList[0].id,
      quizTitle: quizInformation.quizAppList[0].quizTitle,
      quizStartCalendar: quizInformation.quizAppList[0].quizStartCalendar,
      duration: quizInformation.quizAppList[0].duration,
      quizDescription: quizInformation.quizAppList[0].quizDescription,
      quizImageUrl: quizInformation.quizAppList[0].quizImageUrl,
      questionList: quizInformation.quizAppList[0].questionList,
    );
    _question = QuestionsList(
      question: _question.question,
      option1: _question.option1,
      option2: _question.option2,
      option3: _question.option3,
      option4: _question.option4,
      isSelectOption1: isSelectOption1,
      isSelectOption2: isSelectOption2,
      isSelectOption3: isSelectOption3,
      isSelectOption4: isSelectOption4,
    );

    try{
      await Provider.of<QuizAppProvider>(context,listen: false)
          .addQuizQuestions(_question,_questionInformation);
    }catch(error){
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('an error occurred!'),
          content: const Text('Something went wrong'),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }
    Future.delayed(const Duration(seconds: 3),(){
      setState((){
        _isLoading = false;
      });
      clearText();
      setState((){
        numQuestion += 1;
      });
    });
  }

  Future<void> _saveFormFinishQuestion() async{
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return ;
    }
    _formKey.currentState!.save();
    final quizInformation = Provider.of<QuizAppProvider>(context,listen: false);
    _questionInformation = QuizAppModel(
      id: quizInformation.quizAppList[0].id,
      quizTitle: quizInformation.quizAppList[0].quizTitle,
      quizStartCalendar: quizInformation.quizAppList[0].quizStartCalendar,
      duration: quizInformation.quizAppList[0].duration,
      quizDescription: quizInformation.quizAppList[0].quizDescription,
      quizImageUrl: quizInformation.quizAppList[0].quizImageUrl,
      questionList: quizInformation.quizAppList[0].questionList,
    );
    _question = QuestionsList(
      question: _question.question,
      option1: _question.option1,
      option2: _question.option2,
      option3: _question.option3,
      option4: _question.option4,
      isSelectOption1: isSelectOption1,
      isSelectOption2: isSelectOption2,
      isSelectOption3: isSelectOption3,
      isSelectOption4: isSelectOption4,
    );

    Provider.of<QuizAppProvider>(context,listen: false)
        .addQuizQuestions(_question,_questionInformation);
    setState((){
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 3),(){
      setState((){
        _isLoading = false;
      });
      Navigator.pushNamed(context, QuizMarker.routeName);
    });

  }

  Future<void> _addNextQuestion() async{
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return ;
    }
    _formKey.currentState!.save();
    setState((){
      _isLoading = true;
    });
    final quizInformation = Provider.of<QuizAppProvider>(context,listen: false);
    _questionInformation = QuizAppModel(
      id: quizInformation.quizAppList[0].id,
      quizTitle: quizInformation.quizAppList[0].quizTitle,
      quizStartCalendar: quizInformation.quizAppList[0].quizStartCalendar,
      duration: quizInformation.quizAppList[0].duration,
      quizDescription: quizInformation.quizAppList[0].quizDescription,
      quizImageUrl: quizInformation.quizAppList[0].quizImageUrl,
      questionList: quizInformation.quizAppList[0].questionList,
    );
    _question = QuestionsList(
      question: _question.question,
      option1: _question.option1,
      option2: _question.option2,
      option3: _question.option3,
      option4: _question.option4,
      isSelectOption1: isSelectOption1,
      isSelectOption2: isSelectOption2,
      isSelectOption3: isSelectOption3,
      isSelectOption4: isSelectOption4,
    );

    try{
      await Provider.of<QuizAppProvider>(context,listen: false)
          .addNextQuizQuestions(_question,_questionInformation,numQuestion);
    }catch(error){
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('an error occurred!'),
          content: const Text('Something went wrong'),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }
    Future.delayed(const Duration(seconds: 3),(){
      setState((){
        _isLoading = false;
      });
      clearText();
      setState((){
        numQuestion += 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Row(
            children: const [
              Text(
                'Quiz',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Marker',
                style: TextStyle(color: Colors.blue),
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
      body: SafeArea(
        child: _isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Question$numQuestion',
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: double.infinity,
                          child: Form(
                            key: _formKey,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.white12,
                                            width: 2
                                        ),
                                      ),
                                      hintText: 'Question'
                                  ),
                                  focusNode: _questions,
                                  controller: question,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  maxLines: 3,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Field is required';
                                    } if(value.length < 5){
                                      return 'Should be at least 10 characters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    _question = QuestionsList(
                                      question: value!,
                                      option1: _question.option1,
                                      option2: _question.option2,
                                      option3: _question.option3,
                                      option4: _question.option4,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.white12,
                                                  width: 2
                                              ),
                                            ),
                                            hintText: 'Option1'
                                        ),
                                        focusNode: _option1,
                                        controller: option1,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(_option2);
                                        },
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Field is required';
                                          }
                                          return null;
                                        },
                                        onSaved: (value){
                                          _question = QuestionsList(
                                            question: _question.question,
                                            option1: value!,
                                            option2: _question.option2,
                                            option3: _question.option3,
                                            option4: _question.option4,
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Checkbox(
                                        value: isSelectOption1,
                                        onChanged: (bool? value) {
                                          setState((){
                                            isSelectOption4 = false;
                                            isSelectOption3 = false;
                                            isSelectOption2 = false;
                                            isSelectOption1 = true;
                                          });
                                        },

                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.white12,
                                                  width: 2
                                              ),
                                            ),
                                            hintText: 'Option2'
                                        ),
                                        focusNode: _option2,
                                        controller: option2,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(_option3);
                                        },
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Field is required';
                                          }
                                          return null;
                                        },
                                        onSaved: (value){
                                          _question = QuestionsList(
                                            question: _question.question,
                                            option1: _question.option1,
                                            option2: value!,
                                            option3: _question.option3,
                                            option4: _question.option4,
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Checkbox(
                                        value: isSelectOption2,
                                        onChanged: (bool? value) {
                                          setState((){
                                            isSelectOption4 = false;
                                            isSelectOption3 = false;
                                            isSelectOption2 = true;
                                            isSelectOption1 = false;
                                          });

                                        },

                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.white12,
                                                    width: 2
                                                ),
                                              ),
                                              hintText: 'Option3'
                                          ),
                                          focusNode: _option3,
                                          controller: option3,
                                          keyboardType: TextInputType.name,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).requestFocus(_option4);
                                          },
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Field is required';
                                            }
                                            return null;
                                          },
                                          onSaved: (value){
                                            _question = QuestionsList(
                                              question: _question.question,
                                              option1: _question.option1,
                                              option2: _question.option2,
                                              option3: value!,
                                              option4: _question.option4,
                                            );
                                          }
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Checkbox(
                                        value: isSelectOption3,
                                        onChanged: (bool? value) {
                                          setState((){
                                            isSelectOption4 = false;
                                            isSelectOption3 = true;
                                            isSelectOption2 = false;
                                            isSelectOption1 = false;
                                          });
                                        },

                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.white12,
                                                    width: 2
                                                ),
                                              ),
                                              hintText: 'Option4'
                                          ),
                                          focusNode: _option4,
                                          controller: option4,
                                          keyboardType: TextInputType.name,
                                          textInputAction: TextInputAction.next,
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Field is required';
                                            }
                                            return null;
                                          },
                                          onSaved: (value){
                                            _question = QuestionsList(
                                              question: _question.question,
                                              option1: _question.option1,
                                              option2: _question.option2,
                                              option3: _question.option3,
                                              option4: value!,
                                            );
                                          }
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Checkbox(
                                        value: isSelectOption4,
                                        onChanged: (bool? value) {
                                          setState((){
                                            isSelectOption4 = true;
                                            isSelectOption3 = false;
                                            isSelectOption2 = false;
                                            isSelectOption1 = false;
                                          });
                                        },

                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){
                        _saveFormFinishQuestion();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue
                      ),
                      child: const Text(
                        'Finish Question',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        if(numQuestion == 1){
                          _saveFormNextQuestion();
                        }
                        else{
                        _addNextQuestion();
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue
                      ),
                      child: const Text(
                        'Next Question',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
