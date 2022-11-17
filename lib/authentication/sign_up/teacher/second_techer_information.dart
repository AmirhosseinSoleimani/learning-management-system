import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management_system/authentication/customize_stepper_information.dart';
import 'package:learning_management_system/authentication/sign_up/student/phoneNumber_textFormField.dart';
import 'package:learning_management_system/authentication/sign_up/teacher/third_teacher_information.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import 'package:learning_management_system/provider/student_provider.dart';
import 'package:provider/provider.dart';
import '../../../models/student_account.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../store/drawer.dart';
import 'package:country_picker/country_picker.dart';
import 'google_map.dart';


class SecondInformationTeacher extends StatefulWidget {
  const SecondInformationTeacher({Key? key}) : super(key: key);

  @override
  State<SecondInformationTeacher> createState() =>
      _SecondInformationTeacherState();
}

class _SecondInformationTeacherState extends State<SecondInformationTeacher> {



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
    birthDay: Timestamp.fromDate(DateTime.now()).seconds,
    bio: '',
    gender: 0,
    introduction: '',
    country: '',
    favouriteCourse: '', userName: '',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: AppSize.s20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.teacherInformationRoutes);
          },
        ),
        title: Image.asset(
          ImageAssets.epent,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.black, size: AppSize.s30),
      ),
      endDrawer: const DrawerAppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.white,
      body: (_isLoading) ? const Center(
        child: CircularProgressIndicator(),
      ) :Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p16, horizontal: 35.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                      ImageAssets.epentLogo,
                      width: 120.0,
                      height: 120.0,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(AppSize.s10),
                            topLeft: Radius.circular(AppSize.s10),
                        ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: const CustomizeStepperInformation(),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Text(
                  'Information',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.slateGray2),
                ),
                const SizedBox(
                  height: AppSize.s10
                ),
                Form(
                  key: _form,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const PhoneNumberTextFormField(),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(AppSize.s10),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ColorManager.lightSteelBlue2
                                ),
                              ),
                              hintText: 'Address',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: ColorManager.lightSteelBlue1
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: SvgPicture.asset(
                                  IconAssets.address
                                ),
                              )
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
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
                              birthDay: _signupStudent.birthDay,
                              bio: _signupStudent.bio,
                              phoneNumber: _signupStudent.phoneNumber,
                            );
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Container(
                          height: 55.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: ColorManager.lightSteelBlue2,
                            ),
                            borderRadius: BorderRadius.circular(AppSize.s10)
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoogleMapPage())),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(AppPadding.p12),
                                  child: SvgPicture.asset(IconAssets.location),
                                ),
                                const Text(
                                    'Add Location',
                                )
                              ],
                            ),
                          )
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xffD9D9D9)
                                ),
                              ),
                              hintText: 'financial information',
                              hintStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff7E7979)
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: SvgPicture.asset(IconAssets.financial),
                              )
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
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
                              birthDay: _signupStudent.birthDay,
                              bio: _signupStudent.bio,
                              phoneNumber: _signupStudent.phoneNumber,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xffD9D9D9)
                                ),
                              ),
                              hintText: 'Via Card Number',
                              hintStyle: const TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff7E7979)
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: SvgPicture.asset(IconAssets.visaCard),
                              )
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
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
                              birthDay: _signupStudent.birthDay,
                              bio: _signupStudent.bio,
                              phoneNumber: _signupStudent.phoneNumber,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
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
                        // _saveForm();
                        Navigator.pushNamed(context, ThirdInformationStudentSignUp.routeName);
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
