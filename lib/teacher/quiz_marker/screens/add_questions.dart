import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:learning_management_system/provider/quiz_app_provider.dart';
import 'package:provider/provider.dart';

class AddQuestions extends StatefulWidget {
  static const routeName = '/add-question';
  const AddQuestions({Key? key}) : super(key: key);

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
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
                  child: Form(
                    key: _formKey,
                    child: ListView(
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
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Field is required';
                                  }
                                  return null;
                                },
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
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  'Time Answer'
                                ),
                            ),
                            Expanded(
                                child: DateTimePicker(

                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
