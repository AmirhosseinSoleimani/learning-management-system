import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management_system/authentication/customize_stepper_signUp.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';
import '../../../models/teacher_signUp_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../provider/student_provider.dart';
import '../../../provider/teacher_provider.dart';
import '../../../store/drawer.dart';

class InformationTeacherSignUp extends StatefulWidget {

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

  String? dropDownValue;
  var items = ['Male', 'Female','No specified'];

  var itemsIntroduction = ['Friends','Social Media','Website'];

  final _initValues = {
    'name': '',
    'lastName': '',
    'email': ''
  };

  var _teacherSignUpPatch = TeacherSignUpPatch(
    firstName: '',
    lastName: '',
    email: '',
    birthDay: Timestamp.fromDate(DateTime.now()).seconds,
    gender: 1,
    introduction: '',
    country: '',
  );

  final _emailError = false;

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
      await Provider.of<TeacherProvider>(context, listen: false).replaceTeacherSignUp(context,_teacherSignUpPatch);
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
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
            Navigator.of(context).pushReplacementNamed(Routes.teacherSignUpRoutes);
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
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.white,
      body: (_isLoading) ? const Center(
        child: CircularProgressIndicator(),
      ):Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                if(!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p16,
                      horizontal: 35.0
                  ),
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
                if(!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(AppSize.s10),
                              topLeft: Radius.circular(AppSize.s10)
                          )
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: const CustomizeStepperSignUP()
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if(!isKeyboard) Text(
                  'Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppSize.s30,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.slateGray2
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Form(
                  key: _form,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                        child: TextFormField(
                          initialValue: _initValues['name'],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(AppSize.s10),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ColorManager.lightSteelBlue2
                                ),
                              ),
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: ColorManager.lightSteelBlue1
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: SvgPicture.asset(
                                  IconAssets.personIcon
                                ),
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
                            _teacherSignUpPatch = TeacherSignUpPatch(
                              firstName: value!,
                              lastName: _teacherSignUpPatch.lastName,
                              email: _teacherSignUpPatch.email,
                              birthDay: _teacherSignUpPatch.birthDay,
                              gender: _teacherSignUpPatch.gender,
                              introduction: _teacherSignUpPatch.introduction,
                              country: _teacherSignUpPatch.country,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                        child: TextFormField(
                          initialValue: _initValues['lastName'],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(AppSize.s10),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ColorManager.lightSteelBlue2
                                ),
                              ),
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: ColorManager.lightSteelBlue1
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: SvgPicture.asset(
                                  IconAssets.personIcon
                                ),
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
                            _teacherSignUpPatch = TeacherSignUpPatch(
                              firstName: _teacherSignUpPatch.firstName,
                              lastName: value!,
                              email: _teacherSignUpPatch.email,
                              birthDay: _teacherSignUpPatch.birthDay,
                              gender: _teacherSignUpPatch.gender,
                              introduction: _teacherSignUpPatch.introduction,
                              country: _teacherSignUpPatch.country,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                        child: TextFormField(
                          initialValue: _initValues['email'],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(AppSize.s10),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ColorManager.lightSteelBlue2
                                ),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: ColorManager.lightSteelBlue1
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: SvgPicture.asset(
                                  IconAssets.email
                                ),
                              )
                          ),
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            } else if (!value.contains('@')) {
                              return 'Invalid email!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _teacherSignUpPatch = TeacherSignUpPatch(
                              firstName: _teacherSignUpPatch.firstName,
                              lastName: _teacherSignUpPatch.lastName,
                              email: value!,
                              country: _teacherSignUpPatch.country,
                              gender: _teacherSignUpPatch.gender,
                              introduction: _teacherSignUpPatch.introduction,
                              birthDay: _teacherSignUpPatch.birthDay,
                            );
                          },
                        ),
                      ),
                      if (_emailError) Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Provider.of<StudentProvider>(context).userNameError,
                          style: TextStyle(
                              color: ColorManager.error
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p10,
                            vertical: AppPadding.p8
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: DropdownButtonFormField<String>(
                            hint: Text(
                              'Gender',
                              style: TextStyle(
                                  color: ColorManager.lightSteelBlue1,
                                  fontSize: 16.0
                              ),
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: SvgPicture.asset(
                                    IconAssets.gender
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorManager.lightSteelBlue2,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(AppSize.s10),
                              ),
                            ),
                            value: null,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: ColorManager.lightSteelBlue1,
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
                                  _teacherSignUpPatch = TeacherSignUpPatch(
                                    firstName: _teacherSignUpPatch.firstName,
                                    lastName: _teacherSignUpPatch.lastName,
                                    email: _teacherSignUpPatch.email,
                                    birthDay: _teacherSignUpPatch.birthDay,
                                    gender: 1,
                                    introduction: _teacherSignUpPatch.introduction,
                                    country: _teacherSignUpPatch.country,
                                  );
                                });
                              }
                              else if(newValue == 'Female'){
                                {
                                  setState(() {
                                    dropDownValue = newValue!;
                                    _teacherSignUpPatch = TeacherSignUpPatch(
                                      firstName: _teacherSignUpPatch.firstName,
                                      lastName: _teacherSignUpPatch.lastName,
                                      email: _teacherSignUpPatch.email,
                                      birthDay: _teacherSignUpPatch.birthDay,
                                      gender: 0,
                                      introduction: _teacherSignUpPatch.introduction,
                                      country: _teacherSignUpPatch.country,
                                    );
                                  });
                                }
                              }
                              else{
                                setState(() {
                                  dropDownValue = newValue!;
                                  _teacherSignUpPatch = TeacherSignUpPatch(
                                    firstName: _teacherSignUpPatch.firstName,
                                    lastName: _teacherSignUpPatch.lastName,
                                    email: _teacherSignUpPatch.email,
                                    birthDay: _teacherSignUpPatch.birthDay,
                                    gender: 3,
                                    introduction: _teacherSignUpPatch.introduction,
                                    country: _teacherSignUpPatch.country,
                                  );
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p10,
                          vertical: AppPadding.p8
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
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              color: ColorManager.white,
                              border: Border.all(width: 2, color: ColorManager.lightSteelBlue2,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(AppPadding.p12),
                                  child: SvgPicture.asset(
                                    IconAssets.calendar
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: AppPadding.p10),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    child: (dateSelect) ?
                                    DateTimePicker(
                                      initialValue: 'Birthday Date',
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now(),
                                      onChanged: (val) => debugPrint(val),
                                      validator: (val) {
                                        debugPrint(val);
                                        return null;
                                      },
                                      onSaved: (val){
                                        _teacherSignUpPatch = TeacherSignUpPatch(
                                          firstName: _teacherSignUpPatch.firstName,
                                          lastName: _teacherSignUpPatch.lastName,
                                          email: _teacherSignUpPatch.email,
                                          birthDay: Timestamp.fromDate(DateTime.parse(val!)).seconds,
                                          gender: _teacherSignUpPatch.gender,
                                          introduction: _teacherSignUpPatch.introduction,
                                          country: _teacherSignUpPatch.country,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p10,
                          vertical: AppPadding.p8
                        ),
                        child: GestureDetector(
                          onTap: (){
                            showCountryPicker(
                              showPhoneCode: false,
                              onSelect: (Country value) {
                                setState((){
                                  country = value.name;
                                  icon = value.flagEmoji;
                                  _teacherSignUpPatch = TeacherSignUpPatch(
                                    firstName: _teacherSignUpPatch.firstName,
                                    lastName: _teacherSignUpPatch.lastName,
                                    email: _teacherSignUpPatch.email,
                                    birthDay: _teacherSignUpPatch.birthDay,
                                    gender: _teacherSignUpPatch.gender,
                                    introduction: _teacherSignUpPatch.introduction,
                                    country: value.displayName,
                                  );
                                });
                              },
                              context: context,
                            );
                          },
                          child: Container(
                            height: 55.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              color: ColorManager.white,
                              border: Border.all(width: 2, color: ColorManager.lightSteelBlue2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8,
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
                                        style: TextStyle(
                                            color: ColorManager.lightSteelBlue1,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400
                                        ),
                                      )
                                          : Text(
                                        'Country',
                                        style: TextStyle(
                                            color: ColorManager.lightSteelBlue1,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppPadding.p16
                                    ),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: ColorManager.lightSteelBlue1,
                                      size: 28.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p10,
                          vertical: AppPadding.p8
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 55,
                          child: DropdownButtonFormField<String>(
                            hint: Text(
                              'Introduction',
                              style: TextStyle(
                                  color: ColorManager.lightSteelBlue1,
                                  fontSize: 16.0
                              ),
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorManager.lightSteelBlue2,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefixIcon: const Image(image: AssetImage(
                                    ImageAssets.introduction
                                ),)
                            ),
                            value: null,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 28,
                              color: ColorManager.lightSteelBlue1,
                            ),
                            items: itemsIntroduction.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.lightSteelBlue1
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue = newValue!;
                                _teacherSignUpPatch = TeacherSignUpPatch(
                                  firstName: _teacherSignUpPatch.firstName,
                                  lastName: _teacherSignUpPatch.lastName,
                                  email: _teacherSignUpPatch.email,
                                  birthDay: _teacherSignUpPatch.birthDay,
                                  gender: _teacherSignUpPatch.gender,
                                  introduction: newValue,
                                  country: _teacherSignUpPatch.country,
                                );


                              });
                            },
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
                              _saveForm();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primary,
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(AppSize.s50)
                                    )
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.white
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
