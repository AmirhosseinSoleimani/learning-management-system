import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management_system/authentication/customize_stepper_second_information.dart';
import 'package:learning_management_system/authentication/sign_up/student/phoneNumber_textFormField.dart';
import 'package:learning_management_system/models/student_signUp_model.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/provider/student_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../store/drawer.dart';
import 'package:country_picker/country_picker.dart';


class SecondInformationStudent extends StatefulWidget {
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

  var _signupStudent = StudentSignUpPatch(
    phoneNumber: '+989383202865',
    birthDay: Timestamp.fromDate(DateTime.now()).seconds,
    introduction: '',
    country: '',
  );

  var _isLoading = false;
  DateTime date = DateTime.now();
  DateTime? birthday;
  bool selectedBirthday = false;


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
          .replaceSecondStudentSignUp(context,_signupStudent);
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
          ImageAssets.epent,
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
                      ImageAssets.epentLogo,
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
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width,
                    height: 147,
                    child: const CustomizeSecondStepperInformation(),
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
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          const PhoneNumberTextFormField(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: GestureDetector(
                              onTap: () async{
                                birthday = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if(birthday == null){
                                  setState(() {
                                    selectedBirthday = true;
                                  });
                                }else{
                                  selectedBirthday = false;
                                }
                                setState(() {
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
                                    Center(
                                      child: (birthday == null || selectedBirthday == true) ? Text(
                                        'Birthday',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.lightSteelBlue1
                                        ),
                                      ) : Text(
                                        '${birthday!.year}/${birthday!.month}/${birthday!.day}',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.slateGray2
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              showCountryPicker(
                                showPhoneCode: false,
                                onSelect: (Country value) {
                                    setState((){
                                      country = value.name;
                                      icon = value.flagEmoji;
                                      _signupStudent = StudentSignUpPatch(
                                        birthDay: _signupStudent.birthDay,
                                        introduction: _signupStudent.introduction,
                                        phoneNumber: _signupStudent.phoneNumber,
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xffD9D9D9),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                prefixIcon: Image.asset(
                                  ImageAssets.introduction
                                )
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
                                  _signupStudent = StudentSignUpPatch(
                                    phoneNumber: _signupStudent.phoneNumber,
                                    birthDay: _signupStudent.birthDay,
                                    introduction: newValue,
                                    country: _signupStudent.country,
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
