import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../models/student_account.dart';
import '../../../provider/student_provider.dart';
import '../../drawer.dart';
import '../my_separator.dart';
import './second_student_information.dart';

class InformationStudentSignUp extends StatefulWidget {
  static const routeName = '/student_information_signup';

  const InformationStudentSignUp({Key? key}) : super(key: key);

  @override
  State<InformationStudentSignUp> createState() => _InformationStudentSignUpState();
}

class _InformationStudentSignUpState extends State<InformationStudentSignUp> {


  File? _image;
  final _form = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _bioFocusNode = FocusNode();

  String? dropDownValue;
  var items = ['Male', 'Female','No specified'];

  final _initValues = {
    'name': '',
    'lastName': '',
    'bio': ''
  };

  var _signupStudent = StudentAccount(
    firstName: '',
    lastName: '',
    password: '',
    email: '',
    phoneNumber: '',
    birthdayDate: DateTime.now(),
    bio: '',
    gender: '',
    introduction: '',
    country: '',
    favouriteCourse: [],
  );

  var _isLoading = false;

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<StudentProvider>(context, listen: false)
          .addStudentAccount(_signupStudent);

    } catch (error) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('an error occurred!'),
          content: const Text('Something went wrong'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.pushNamed(context, SecondInformationStudent.routeName);
  }



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

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Image.asset(
          'assets/images/epent.png',
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 30.0),
      ),
      endDrawer: const DrawerAppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                if(!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 35.0
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                      'assets/images/epent_only_logo.png',
                      width: 120.0,
                      height: 120.0,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                if(!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff177FB0),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)
                        )
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff5DBF23),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                height: 35,
                                child: MySeparator(
                                  color: Color(0xffD9D9D9),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff5DBF23),
                                  child: null,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                height: 35,
                                child: MySeparator(color: Color(0xffD9D9D9),),
                              ),
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffD9D9D9),
                                  child: null,
                                  ),
                                ),
                              SizedBox(
                                width: 60,
                                height: 35,
                                child: MySeparator(color: Color(0xffD9D9D9),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffD9D9D9),
                                  child: null
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.0
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                  'Information',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: 13.0,
                              ),
                              Text(
                                  'Information',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  'Favourite',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 83.0
                                ),
                                child: SizedBox(
                                  width: 75,
                                  height: 1,
                                  child: Divider(
                                    thickness: 5,
                                    color: Color(0xff5DBF23),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Information',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3F3D56)
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          TextFormField(
                            initialValue: _initValues['name'],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffD9D9D9)
                                  ),
                                ),
                                hintText: 'Name',
                                hintStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xff7E7979)
                                ),
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  size: 28.0,
                                  color: Color(0xff7E7979),
                                )
                            ),
                            focusNode: _nameFocusNode,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_lastNameFocusNode);
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _signupStudent = StudentAccount(
                                firstName: value!,
                                lastName: '',
                                password: studentProvider.studentAccount[0].password,
                                email: studentProvider.studentAccount[0].email,
                                phoneNumber: '',
                                birthdayDate: DateTime.now(),
                                bio: '',
                                gender: '',
                                introduction: '',
                                country: '',
                                favouriteCourse: [],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            initialValue: _initValues['lastName'],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffD9D9D9)
                                  ),
                                ),
                                hintText: 'Last Name',
                                hintStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xff7E7979)
                                ),
                                prefixIcon: const Icon(
                                  Icons.people_outline,
                                  size: 28.0,
                                  color: Color(0xff7E7979),
                                )
                            ),
                            focusNode: _lastNameFocusNode,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _signupStudent = StudentAccount(
                                firstName: _signupStudent.firstName,
                                lastName: value!,
                                password: studentProvider.studentAccount[0].password,
                                email: studentProvider.studentAccount[0].email,
                                phoneNumber: '',
                                birthdayDate: DateTime.now(),
                                bio: '',
                                gender: '',
                                introduction: '',
                                country: '',
                                favouriteCourse: [],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: DropdownButtonFormField<String>(
                                hint: const Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: Color(0xff7E7979),
                                      fontSize: 16.0
                                  ),
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xffD9D9D9),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                    ),
                                ),
                                value: null,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                  color: Color(0xff7E7979),
                                ),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropDownValue = newValue!;
                                    _signupStudent = StudentAccount(
                                      firstName: _signupStudent.firstName,
                                      lastName: _signupStudent.lastName,
                                      password: studentProvider.studentAccount[0].password,
                                      email: studentProvider.studentAccount[0].email,
                                      phoneNumber: '',
                                      birthdayDate: DateTime.now(),
                                      bio: '',
                                      gender: newValue,
                                      introduction: '',
                                      country: '',
                                      favouriteCourse: [],
                                    );
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.18,
                              child: TextFormField(
                                maxLines: 8,
                                initialValue: _initValues['bio'],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Color(0xffD9D9D9)
                                      ),
                                    ),
                                    hintText: 'Bio',
                                    hintStyle: const TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xff7E7979)
                                    ),
                                ),
                                focusNode: _bioFocusNode,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Field is required';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _signupStudent = StudentAccount(
                                    firstName: _signupStudent.firstName,
                                    lastName: _signupStudent.lastName,
                                    password: studentProvider.studentAccount[0].password,
                                    email: studentProvider.studentAccount[0].email,
                                    phoneNumber: '',
                                    birthdayDate: DateTime.now(),
                                    bio: _signupStudent.bio,
                                    gender: _signupStudent.gender,
                                    introduction: '',
                                    country: '',
                                    favouriteCourse: [],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text(
                                      'Please Add Image',
                                    ),
                                    content: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.14,
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 90.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFffffff),
                                  border: Border.all(
                                      width: 2, color: const Color(0xff7E7979),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: Center(
                                  child: (_image != null) ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(
                                        _image!,

                                  ),
                                ) : SvgPicture.asset(
                                    'assets/images/person.svg',
                                    width: 80,
                                    height: 80,
                                  ),
                            ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'Select Avatar',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7E7979)
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 87.0,
                      left: 87.0,
                      bottom: 20.0
                  ),
                  child: TextButton(
                      onPressed: (){
                        _saveForm();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff177FB0),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)
                              )
                          )
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFFFFFF)
                          ),
                        ),
                      )
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
