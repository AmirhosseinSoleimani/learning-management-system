import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/quiz_app_model.dart';
import 'package:date_time_picker/date_time_picker.dart';
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

  var _question = QuestionsList(
    question: '',
    option1: '',
    option2: '',
    option3: '',
    option4: '',
    dateTime: DateTime(0,0,0),
    isSelectOption1: false,
    isSelectOption2: false,
    isSelectOption3: false,
    isSelectOption4: false,

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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Form(
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
                                  dateTime: _question.dateTime,
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
                                        dateTime: _question.dateTime,
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
                                      _question = QuestionsList(
                                        question: _question.question,
                                        option1: _question.option1,
                                        option2: _question.option2,
                                        option3: _question.option3,
                                        option4: _question.option4,
                                        dateTime: _question.dateTime,
                                        isSelectOption1: true,
                                        isSelectOption2: false,
                                        isSelectOption3: false,
                                        isSelectOption4: false,
                                      );
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
                                        dateTime: _question.dateTime,
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
                                        _question = QuestionsList(
                                          question: _question.question,
                                          option1: _question.option1,
                                          option2: _question.option2,
                                          option3: _question.option3,
                                          option4: _question.option4,
                                          dateTime: _question.dateTime,
                                          isSelectOption1: false,
                                          isSelectOption2: true,
                                          isSelectOption3: false,
                                          isSelectOption4: false,
                                        );
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
                                          dateTime: _question.dateTime,
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
                                        _question = QuestionsList(
                                          question: _question.question,
                                          option1: _question.option1,
                                          option2: _question.option2,
                                          option3: _question.option3,
                                          option4: _question.option4,
                                          dateTime: _question.dateTime,
                                          isSelectOption1: false,
                                          isSelectOption2: false,
                                          isSelectOption3: true,
                                          isSelectOption4: false,
                                        );
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
                                          dateTime: _question.dateTime,
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
                                        _question = QuestionsList(
                                          question: _question.question,
                                          option1: _question.option1,
                                          option2: _question.option2,
                                          option3: _question.option3,
                                          option4: _question.option4,
                                          dateTime: _question.dateTime,
                                          isSelectOption1: false,
                                          isSelectOption2: false,
                                          isSelectOption3: false,
                                          isSelectOption4: true,
                                        );
                                      });
                                    },

                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                    child: Text(
                                      'Time Answer :',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                ),
                                Expanded(
                                  flex: 1,
                                    child: GestureDetector(
                                      onTap: (){
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) => SizedBox(
                                              height: MediaQuery.of(context).size.height * 0.3,
                                              child: CupertinoTimerPicker(
                                                mode: CupertinoTimerPickerMode.ms,
                                                initialTimerDuration: controller.duration!,
                                                onTimerDurationChanged: (Duration time) {
                                                  setState((){
                                                    _question = QuestionsList(
                                                      question: _question.question,
                                                      option1: _question.option1,
                                                      option2: _question.option2,
                                                      option3: _question.option3,
                                                      option4: _question.option4,
                                                      dateTime: DateTime(0,0,0));
                                                    controller.duration = time;
                                                    _question = QuestionsList(
                                                      question: _question.question,
                                                      option1: _question.option1,
                                                      option2: _question.option2,
                                                      option3: _question.option3,
                                                      option4: _question.option4,
                                                      dateTime: _question.dateTime.add(time),
                                                    );
                                                  });
                                                },

                                              ),
                                            ),
                                        );
                                      },
                                      child: AnimatedBuilder(
                                        animation: controller,
                                        builder: (context, child) => Text(
                                            countText,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        ),
                                      ),
                                    )
                              ],
                            )
                          ],
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
                        print(_question.dateTime);
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
                      onPressed: (){},
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
