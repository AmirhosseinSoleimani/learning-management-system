import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/student_account.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:im_stepper/stepper.dart';

import '../../provider/student_provider.dart';


class StudentSignUp extends StatefulWidget {
  static const routeName = '/student-signup';
  const StudentSignUp({Key? key}) : super(key: key);

  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {

  int activeStep = 1;
  int upperBound = 4;
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _countryFocusNode = FocusNode();

  String dropDownValue = 'Male';
  Country? onSelectedCountry;
  var items = ['Male', 'Female', 'Non-binary', 'I prefer not to say'];
  final _form = GlobalKey<FormState>();
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  // var _signupStudent = StudentAccount(
  //     id: '',
  //     firstName: '',
  //     lastName: '',
  //     dateTime: DateTime.now(),
  //     password: '',
  //     gender: '',
  //     country: '',
  //     phoneNumber: '',
  //     email: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            )),
        body: Center(
          child: Text('${Provider
        .of<StudentProvider>(context)
        .studentAccount[0].firstName}',
        )
        )
    );
  }
}