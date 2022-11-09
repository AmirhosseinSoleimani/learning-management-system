import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../models/student_account.dart';
import '../../../provider/student_provider.dart';
import '../../../store/drawer.dart';
import '../student/customize_stepper_first_information.dart';

class InformationTeacherSignUp extends StatefulWidget {
  static const routeName = '/teacher_information_signup';

  const InformationTeacherSignUp({Key? key}) : super(key: key);

  @override
  State<InformationTeacherSignUp> createState() => _InformationTeacherSignUpState();
}

class _InformationTeacherSignUpState extends State<InformationTeacherSignUp> {


  String? country;
  Country iran = Country(
    phoneCode: '98',
    countryCode: 'IR',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Iran',
    example: '9123456789',
    displayName: 'Iran (IR) [+98]',
    displayNameNoCountryCode: 'Iran (IR)',
    e164Key: '98-IR-0',
  );
  String? icon;
  bool dateSelect = false;
  final _form = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
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
    birthDay: Timestamp.fromDate(DateTime.now()).seconds,
    bio: '',
    gender: 1,
    introduction: '',
    country: '',
    favouriteCourse: '',
    userName: '',
  );

  var _emailError = false;

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
          .replaceStudentAccount(context,_signupStudent);

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
  Widget build(BuildContext context) {
    final studentAccount = Provider.of<StudentProvider>(context);
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
      ):Padding(
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
                      child: const CustomizeStepperFirstInformation()
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if(!isKeyboard)  const Text(
                  'Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3F3D56)
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: _form,
                  child: ListView(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
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
                              lastName: _signupStudent.lastName,
                              password: studentAccount.studentAccount[0].password,
                              email: _signupStudent.email,
                              phoneNumber: _signupStudent.phoneNumber,
                              birthDay: _signupStudent.birthDay,
                              bio: _signupStudent.bio,
                              gender: _signupStudent.gender,
                              introduction: _signupStudent.introduction,
                              country: _signupStudent.country,
                              favouriteCourse: _signupStudent.favouriteCourse,
                              userName: studentAccount.studentAccount[0].userName,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
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
                              password: _signupStudent.password,
                              email: _signupStudent.email,
                              phoneNumber: _signupStudent.phoneNumber,
                              birthDay: _signupStudent.birthDay,
                              bio: _signupStudent.bio,
                              gender: _signupStudent.gender,
                              introduction: _signupStudent.introduction,
                              country: _signupStudent.country,
                              favouriteCourse: _signupStudent.favouriteCourse,
                              userName: _signupStudent.userName,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          initialValue: _initValues['email'],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xffD9D9D9)
                                ),
                              ),
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff7E7979)
                              ),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                size: 28.0,
                                color: Color(0xff7E7979),
                              )
                          ),
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(_bioFocusNode);
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            } else if (!value.contains('@')) {
                              return 'Invalid email!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _signupStudent = StudentAccount(
                              firstName: _signupStudent.firstName,
                              lastName: _signupStudent.lastName,
                              password: _signupStudent.password,
                              email: value!,
                              country: _signupStudent.country,
                              favouriteCourse: _signupStudent.favouriteCourse,
                              gender: _signupStudent.gender,
                              introduction: _signupStudent.introduction,
                              birthDay: _signupStudent.birthDay,
                              bio: _signupStudent.bio,
                              phoneNumber: _signupStudent.phoneNumber, userName: '',
                            );
                          },
                        ),
                      ),
                      if (_emailError) Padding(
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
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 8.0
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
                                  validator: (value) {
                                    if(value!.isEmpty) {
                                      return 'field is required';
                                    }
                                    return null;
                                  },
                                  onChanged: (String? newValue) {
                                    if(newValue == 'Male'){
                                      setState(() {
                                        dropDownValue = newValue!;
                                        _signupStudent = StudentAccount(
                                          firstName: _signupStudent.firstName,
                                          lastName: _signupStudent.lastName,
                                          password: _signupStudent.password,
                                          email: _signupStudent.email,
                                          phoneNumber: _signupStudent.phoneNumber,
                                          birthDay: _signupStudent.birthDay,
                                          bio: _signupStudent.bio,
                                          gender: 1,
                                          introduction: _signupStudent.introduction,
                                          country: _signupStudent.country,
                                          favouriteCourse: _signupStudent.favouriteCourse,
                                          userName: _signupStudent.userName,
                                        );
                                      });
                                    }
                                    else if(newValue == 'Female'){
                                      {
                                        setState(() {
                                          dropDownValue = newValue!;
                                          _signupStudent = StudentAccount(
                                            firstName: _signupStudent.firstName,
                                            lastName: _signupStudent.lastName,
                                            password: _signupStudent.password,
                                            email: _signupStudent.email,
                                            phoneNumber: _signupStudent.phoneNumber,
                                            birthDay: _signupStudent.birthDay,
                                            bio: _signupStudent.bio,
                                            gender: 0,
                                            introduction: _signupStudent.introduction,
                                            country: _signupStudent.country,
                                            favouriteCourse: _signupStudent.favouriteCourse,
                                            userName: _signupStudent.userName,
                                          );
                                        });
                                      }
                                    }
                                    else{
                                      setState(() {
                                        dropDownValue = newValue!;
                                        _signupStudent = StudentAccount(
                                          firstName: _signupStudent.firstName,
                                          lastName: _signupStudent.lastName,
                                          password: _signupStudent.password,
                                          email: _signupStudent.email,
                                          phoneNumber: _signupStudent.phoneNumber,
                                          birthDay: _signupStudent.birthDay,
                                          bio: _signupStudent.bio,
                                          gender: 3,
                                          introduction: _signupStudent.introduction,
                                          country: _signupStudent.country,
                                          favouriteCourse: _signupStudent.favouriteCourse,
                                          userName: _signupStudent.userName,
                                        );
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 8.0
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  setState((){
                                    dateSelect = true;
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    border: Border.all(width: 2, color: const Color(0xffD9D9D9),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Icon(
                                          Icons.event_outlined,
                                          size: 22.0,
                                          color: Color(0xff7E7979),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        height: MediaQuery.of(context).size.height * 0.08,
                                        child: (dateSelect) ?
                                        DateTimePicker(
                                          initialValue: 'Birthday Date',
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime.now(),
                                          onChanged: (val) => print(val),
                                          validator: (val) {
                                            print(val);
                                            return null;
                                          },
                                          onSaved: (val){
                                            _signupStudent = StudentAccount(
                                              firstName: studentAccount.studentAccount[0].firstName,
                                              lastName: studentAccount.studentAccount[0].lastName,
                                              password: studentAccount.studentAccount[0].password,
                                              email: studentAccount.studentAccount[0].email,
                                              phoneNumber: studentAccount.phoneNumberTextFormField!,
                                              birthDay: Timestamp.fromDate(DateTime.parse(val!)).seconds,
                                              bio: studentAccount.studentAccount[0].bio,
                                              gender: studentAccount.studentAccount[0].gender,
                                              introduction: _signupStudent.introduction,
                                              country: _signupStudent.country,
                                              favouriteCourse: _signupStudent.favouriteCourse, userName: '',
                                            );
                                          },
                                        ):
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 8.0,
                                          ),
                                          child: Text(
                                            'Birthday Date',
                                            style: TextStyle(
                                                color: Color(0xff7E7979),
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 8.0
                        ),
                        child: GestureDetector(
                          onTap: (){
                            showCountryPicker(
                              showPhoneCode: false,
                              onSelect: (Country value) {
                                setState((){
                                  country = value.name;
                                  icon = value.flagEmoji;
                                  _signupStudent = StudentAccount(
                                    firstName: _signupStudent.firstName,
                                    lastName: _signupStudent.lastName,
                                    password: _signupStudent.password,
                                    email: _signupStudent.email,
                                    phoneNumber: _signupStudent.phoneNumber,
                                    birthDay: _signupStudent.birthDay,
                                    bio: _signupStudent.bio,
                                    gender: _signupStudent.gender,
                                    introduction: _signupStudent.introduction,
                                    country: value.displayName,
                                    favouriteCourse: _signupStudent.favouriteCourse, userName: '',
                                  );
                                });
                              },
                              context: context,
                            );
                          },
                          child: Container(
                            height: 55.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              border: Border.all(width: 2, color: const Color(0xffD9D9D9),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      (icon) != null
                                          ? Text(
                                        icon!,
                                        style: const TextStyle(
                                            fontSize: 22.0
                                        ),
                                      )
                                          : Text(
                                        iran.flagEmoji,
                                        style: const TextStyle(
                                            fontSize: 22.0
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      (country) != null ?
                                      Text(
                                        country!,
                                        style: const TextStyle(
                                            color: Color(0xff7E7979),
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400
                                        ),
                                      )
                                          :const Text(
                                        'Country',
                                        style: TextStyle(
                                            color: Color(0xff7E7979),
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        right: 15.0
                                    ),
                                    child: Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Color(0xff7E7979),
                                      size: 28.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 87.0,
                            left: 87.0,
                            bottom: 70.0
                        ),
                        child: TextButton(
                            onPressed: (){
                              // _saveForm();
                              // _emailError = true;
                              // Future.delayed(const Duration(seconds: 5), () {
                              //   setState((){
                              //     _emailError = false;
                              //   });
                              // });
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
