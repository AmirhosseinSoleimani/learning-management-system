import 'package:flutter/material.dart';

class QuizMarker extends StatefulWidget {
  static const routeName = '/quiz-marker';
  const QuizMarker({Key? key}) : super(key: key);

  @override
  State<QuizMarker> createState() => _QuizMarkerState();
}

class _QuizMarkerState extends State<QuizMarker> {
  final _formKey = GlobalKey<FormState>();
  final _quizTitleFocusNode = FocusNode();
  final _quizDescriptionFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios,
                    size: 18.0,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Quiz Title'
                        ),
                        focusNode: _quizTitleFocusNode,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_quizDescriptionFocusNode);
                        },
                        validator: (String? value){
                          if(value!.isEmpty){
                            return 'Field is required';
                          }
                          return null;
                        },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none
                          ),
                          hintText: 'Description'
                      ),
                      focusNode: _quizTitleFocusNode,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_quizDescriptionFocusNode);
                      },
                      validator: (String? value){
                        if(value!.isEmpty){
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30.0),
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Create Quiz',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
