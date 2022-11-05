import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/models/student_account.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../provider/student_provider.dart';
import '../../../store/drawer.dart';


class StudentSignUp extends StatefulWidget {
  static const routeName = '/student_signup';

  const StudentSignUp({Key? key}) : super(key: key);

  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  final _passwordFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  bool isSelected = false;
  final _initValues = {
    'user_name': '',
    'password': '',
  };

  // final _passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  bool _passwordVisible = false;

  var _signupStudent = StudentAccount(
    firstName: 'Student',
    lastName: 'Student',
    password: '123456',
    email: 'example@gmail.com',
    phoneNumber: '+091212345678',
    birthdayDate: Timestamp.fromDate(DateTime.now()).seconds,
    bio: 'Student',
    gender: 1,
    introduction: 'Student',
    country: 'Student',
    favouriteCourse: [],
    userName: 'Student',
  );

  var _isLoading = false;

  var _userNameError = false;

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
          .addStudentAccount(context,_signupStudent);
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

  }

  @override
  void dispose() {
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: (_isLoading) ? const Center(
        child: CircularProgressIndicator(),
      ) : Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                      'assets/images/epent_body.png',
                      width: 120.0,
                      height: 120.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
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
                            initialValue: _initValues['user_name'],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffD9D9D9)
                                    ),
                                ),
                                hintText: 'User Name',
                              hintStyle: const TextStyle(
                                fontSize: 16.0,
                                color: Color(0xff7E7979)
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                size: 28.0,
                                color: Color(0xff7E7979),
                              )
                            ),
                            focusNode: _userNameFocusNode,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _signupStudent = StudentAccount(
                                userName: value!,
                                firstName: _signupStudent.firstName,
                                lastName: _signupStudent.lastName,
                                password: _signupStudent.password,
                                email: _signupStudent.email,
                                country: _signupStudent.country,
                                favouriteCourse: _signupStudent.favouriteCourse,
                                gender: _signupStudent.gender,
                                introduction: _signupStudent.introduction,
                                birthdayDate: _signupStudent.birthdayDate,
                                bio: _signupStudent.bio,
                                phoneNumber: _signupStudent.phoneNumber,
                              );
                            },
                          ),
                          if (_userNameError) Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Provider.of<StudentProvider>(context).userNameError,
                              style: const TextStyle(
                                color: Colors.red
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                              initialValue: _initValues['password'],
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible =
                                            !_passwordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color(0xff7E7979),
                                      size: 28.0,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    size: 28.0,
                                      color: Color(0xff7E7979),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Color(0xffD9D9D9)
                                  ),
                              ),
                                  hintText: 'Password'),
                              obscureText: !_passwordVisible,
                              // controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                } else if (value.length < 6) {
                                  return 'Password is too short!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _signupStudent = StudentAccount(
                                  firstName: _signupStudent.firstName,
                                  lastName: _signupStudent.lastName,
                                  password: value!,
                                  email: _signupStudent.email,
                                  country: _signupStudent.country,
                                  favouriteCourse: _signupStudent.favouriteCourse,
                                  gender: _signupStudent.gender,
                                  introduction: _signupStudent.introduction,
                                  birthdayDate: _signupStudent.birthdayDate,
                                  bio: _signupStudent.bio,
                                  phoneNumber: _signupStudent.phoneNumber,
                                  userName: _signupStudent.userName,
                                );
                              }
                              )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 87.0
                  ),
                  child: TextButton(
                      onPressed: (){
                        _saveForm();
                        _userNameError = true;
                        Future.delayed(const Duration(seconds: 5), () {
                          setState((){
                            _userNameError = false;
                          });
                        });
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
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)
                        ),
                      )
                  ),
                ),
                if(!isKeyboard) const SizedBox(
                  height: 20.0,
                ),
                if(!isKeyboard) Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 20.0),
                        child: const Divider(
                          color: Color(0xffD9D9D9),
                          thickness: 1,
                          height: 10,
                        ),
                      ),
                    ),
                    const Text(
                      'Or Sign Up With',
                      style: TextStyle(
                        color: Color(0xff7E7979)
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Color(0xffD9D9D9),
                            thickness: 1,
                            height: 10,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                if(!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              color: const Color(0xFFffffff),
                              border: Border.all(
                                  width: 1, color: const Color(0xffD9D9D9)),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                              ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                blurRadius: 12.0, // soften the shadow
                                spreadRadius: 6.0, //extend the shadow
                                offset: const Offset(
                                  0, // Move to right 5  horizontally
                                  0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/Google.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFffffff),
                              border: Border.all(
                                  width: 1, color: const Color(0xffD9D9D9)),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                              ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                blurRadius: 12.0, // soften the shadow
                                spreadRadius: 6.0, //extend the shadow
                                offset: const Offset(
                                  0, // Move to right 5  horizontally
                                  0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],

                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/LinkedIn.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if(!isKeyboard) const SizedBox(
                  height: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do have an account?',
                        style: TextStyle(
                          color: Color(0xff7E7979),
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xff177FB0),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
