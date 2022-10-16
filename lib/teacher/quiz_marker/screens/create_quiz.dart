import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_management_system/models/quiz_app_model.dart';
import 'package:learning_management_system/provider/quiz_app_provider.dart';
import 'package:learning_management_system/teacher/quiz_marker/screens/add_questions.dart';
import 'package:provider/provider.dart';

File? _image;

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  final _quizTitleFocusNode = FocusNode();
  final _quizDescriptionFocusNode = FocusNode();

  Future pickImage(ImageSource source) async {
    try{
      final XFile? image = await ImagePicker().pickImage(source: source);
      if(image == null) return;
      final  imageTemporary = File(image.path);
      setState(() => _image = imageTemporary);
    } on PlatformException catch(e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  String? quizImageUrl, quizTitle, quizDescription, quizId;

  bool _isLoading = false;
  String? _imageUrl;
  var _quizGeneralInformation = QuizAppModel(
    quizTitle: '',
    quizDescription: '',
    quizImageUrl: '',
    id: DateTime.now().toString(),
    questionList: [],
  );

  Future<void> createQuizOnline() async{
    if(!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
      setState((){
        _isLoading = true;
      });
      // try{
      //   await Provider.of<QuizAppProvider>(context,listen: false)
      //       .addQuizInformation(_quizGeneralInformation);
      //   Navigator.pushNamed(context, AddQuestions.routeName);
      // }catch(error){
      //   await showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: const Text('an error occurred!'),
      //       content: const Text('Something went wrong'),
      //       actions: [
      //         TextButton(
      //             onPressed: (){
      //               Navigator.of(context).pop();
      //             },
      //             child: const Text('Okay'))
      //       ],
      //     ),
      //   );
      // }
    Provider.of<QuizAppProvider>(context,listen: false)
          .addQuizInformation(_quizGeneralInformation);
      Navigator.pushNamed(context, AddQuestions.routeName);
      setState((){
        _isLoading = false;
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
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: (_image !=null) ? Image.file(
                              _image!,fit: BoxFit.cover,
                            ): (_imageUrl != null) ? Image.network(_imageUrl!,fit: BoxFit.fill,):
                            Image.asset(
                              'assets/images/quiz.png',
                              fit: BoxFit.cover,
                            )
                        ),
                        Positioned(
                          left: 285,
                          top: -5.0,
                          child: IconButton(
                              onPressed: (){
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context){
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.2,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.delete,
                                                size: 30.0,
                                              ),
                                              title: const Text(
                                                'Delete Photo',
                                                style: TextStyle(
                                                  fontSize: 16.0
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Colors.grey.shade500,
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                Icons.edit,
                                                size: 30.0,
                                              ),
                                              title: const Text(
                                                'Edit Photo',
                                                style: TextStyle(
                                                    fontSize: 16.0
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.grey.shade500,
                                size: 30.0,
                              )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
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
                      onSaved: (value){
                        _quizGeneralInformation = QuizAppModel(
                            id: _quizGeneralInformation.id,
                            quizTitle: value!,
                            quizDescription: _quizGeneralInformation.quizDescription,
                            quizImageUrl: _quizGeneralInformation.quizImageUrl,
                            questionList: []);
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
                        onSaved: (value){
                          _quizGeneralInformation = QuizAppModel(
                              id: _quizGeneralInformation.id,
                              quizTitle: _quizGeneralInformation.quizTitle,
                              quizDescription: value!,
                              quizImageUrl: _quizGeneralInformation.quizImageUrl,
                              questionList: []);
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
                                          onPressed: (){
                                            pickImage(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },
                                          color: Colors.blue,
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.image_outlined,
                                                color: Colors.white70,
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                'Pick Image from Gallery',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),),
                                      MaterialButton(
                                        onPressed: (){
                                          pickImage(ImageSource.camera);
                                          Navigator.of(context).pop();
                                        },
                                        color: Colors.blue,
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              color: Colors.white70,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              'Pick Image from Camera',
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          ],
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
                                        onChanged: (value){
                                          _imageUrl = value;
                                        },
                                        onSaved: (value){
                                          _quizGeneralInformation = QuizAppModel(
                                              id: _quizGeneralInformation.id,
                                              quizTitle: _quizGeneralInformation.quizTitle,
                                              quizDescription: _quizGeneralInformation.quizDescription,
                                              quizImageUrl: value!,
                                              questionList: []);
                                        } ,
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
                  createQuizOnline();
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
