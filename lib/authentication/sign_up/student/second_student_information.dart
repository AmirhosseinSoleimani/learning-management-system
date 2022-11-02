import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_up/student/customize_stepper_second_information.dart';
import 'package:learning_management_system/authentication/sign_up/student/phoneNumber_textFormField.dart';
import 'package:learning_management_system/provider/student_provider.dart';
import 'package:provider/provider.dart';
import '../../../models/student_account.dart';
import '../../drawer.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'favourite.dart';


class SecondInformationStudent extends StatefulWidget {
  static const routeName = '/second_student_information_signup';
  const SecondInformationStudent({Key? key}) : super(key: key);

  @override
  State<SecondInformationStudent> createState() =>
      _SecondInformationStudentState();
}

class _SecondInformationStudentState extends State<SecondInformationStudent> {

  bool dateSelect = false;
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
  final _form = GlobalKey<FormState>();

  String? dropDownValue;
  var items = ['Friend', 'Social Media','Website'];

  var _signupStudent = StudentAccount(
    firstName: '',
    lastName: '',
    password: '',
    email: '',
    phoneNumber: '',
    birthdayDate: Timestamp.fromDate(DateTime.now()).seconds,
    bio: '',
    gender: 0,
    introduction: '',
    country: '',
    favouriteCourse: [], userName: '',
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
    Navigator.pushNamed(context, FavouriteStudent.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final studentAccount = Provider.of<StudentProvider>(context);
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
      ) :Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 35.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff177FB0),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: const CustomizeStepperSecondInformation(),
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
                      color: Color(0xff3F3D56)),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  width: double.infinity,
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const PhoneNumberTextFormField(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                dateSelect = true;
                              });
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Icon(
                                      Icons.event_outlined,
                                      size: 28.0,
                                      color: Color(0xff7E7979),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    height: 40,
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
                                          birthdayDate: Timestamp.fromDate(DateTime.parse(val!)).seconds,
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
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          GestureDetector(
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
                                        birthdayDate: _signupStudent.birthdayDate,
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
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 55,
                            child: DropdownButtonFormField<String>(
                              hint: const Text(
                                'Introduction',
                                style: TextStyle(
                                    color: Color(0xff7E7979),
                                    fontSize: 16.0
                                ),
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xffD9D9D9),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefixIcon: const Icon(Icons.person)
                              ),
                              value: null,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 28,
                                color: Color(0xff7E7979),
                              ),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff7E7979)
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                  _signupStudent = StudentAccount(
                                    firstName: _signupStudent.firstName,
                                    lastName: _signupStudent.lastName,
                                    password: _signupStudent.password,
                                    email: _signupStudent.email,
                                    phoneNumber: _signupStudent.phoneNumber,
                                    birthdayDate: _signupStudent.birthdayDate,
                                    bio: _signupStudent.bio,
                                    gender: _signupStudent.gender,
                                    introduction: newValue,
                                    country: _signupStudent.country,
                                    favouriteCourse: _signupStudent.favouriteCourse, userName: '',
                                  );


                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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
