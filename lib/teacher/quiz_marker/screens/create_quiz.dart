import 'package:flutter/material.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  final _quizTitleFocusNode = FocusNode();
  final _quizDescriptionFocusNode = FocusNode();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
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
                          hintText: 'Quiz Title'
                      ),
                      focusNode: _quizTitleFocusNode,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_quizDescriptionFocusNode);
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: Colors.white12,
                                width: 2
                            ),
                          ),
                          hintText: 'Description'
                      ),
                      focusNode: _quizDescriptionFocusNode,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      maxLines: 3,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        } if(value.length < 10){
                          return 'Should be at least 10 characters long.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Add Quiz Image(Optional)',
                      style: TextStyle(
                        fontSize: 14.0
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                    'Quiz Image Picker',
                                ),
                                content: SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      MaterialButton(
                                          onPressed: (){},
                                          color: Colors.blue,
                                          child: const Text(
                                            'Pick Image from Gallery',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w400
                                            ),
                                          ),),
                                      MaterialButton(
                                        onPressed: (){},
                                        color: Colors.blue,
                                        child: const Text(
                                          'Pick Image from Camera',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.white12,
                                                  width: 2
                                              ),
                                            ),
                                            hintText: 'Quiz Image URL'
                                        ),
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                        'Cancel'
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: const Text(
                                        'Accept'
                                    ),
                                  ),
                                ],
                              ),
                          );
                        },
                      style: TextButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: Colors.black54
                        )
                      ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black54,
                        ),
                    )

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0
            ),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: (){
                  print('clicked');
                },
                child: const Text(
                  'Create Quiz',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
