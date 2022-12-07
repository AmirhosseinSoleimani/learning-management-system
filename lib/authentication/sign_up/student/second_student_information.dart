import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management_system/authentication/customize_stepper_second_information.dart';
import 'package:learning_management_system/models/student_signUp_model.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/provider/student_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../store/drawer.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';



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
    phoneNumber: '',
    birthDay: Timestamp.fromDate(DateTime.now()).seconds,
    introduction: '',
    country: '',
  );

  final TextEditingController controller = TextEditingController();

  String initialCountry = 'IR';

  var _isLoading = false;

  bool isSelected = false;

  DateTime date = DateTime.now();

  DateTime? birthday;

  bool selectedBirthday = false;

  final FocusNode _phoneNumber = FocusNode();


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


  String phoneNumber = '';
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final cubeGrid = SpinKitCubeGrid(
    size: 100,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? ColorManager.slateGray2 : ColorManager.lightSteelBlue2,
        ),
      );
    },
  );

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
            Navigator.of(context).pushReplacementNamed(Routes.studentInformation);
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
      body: (_isLoading) ? Center(
        child: cubeGrid,
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
                  height: 300,
                  width: double.infinity,
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          (isSelected) ? Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 55.0,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color(0xffD9D9D9),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InternationalPhoneNumberInput(
                              autoFocus: true,
                              inputDecoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '9121234567'
                              ),
                              textFieldController: controller,
                              maxLength: 10,
                              focusNode: _phoneNumber,
                              keyboardType: TextInputType.number,
                              keyboardAction: TextInputAction.done,
                              initialValue: PhoneNumber(isoCode: 'IR'),
                                onInputChanged: (PhoneNumber number){
                                 phoneNumber = number.phoneNumber.toString();
                                  _signupStudent = StudentSignUpPatch(
                                    phoneNumber: phoneNumber,
                                    birthDay: _signupStudent.birthDay,
                                    introduction: _signupStudent.introduction,
                                    country: _signupStudent.country,
                                  );
                                },
                              formatInput: false,
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Field is required';
                                }
                                return null;
                              },
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                setSelectorButtonAsPrefixIcon: true,
                                showFlags: true,
                                useEmoji: false,
                              ),
                            ),
                          ) : TextFormField(
                            onTap: () {
                              setState(() {
                                isSelected = true;
                              });
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: ColorManager.lightSteelBlue2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(AppSize.s10),
                                  borderSide:
                                  const BorderSide(width: 2, color: Color(0xffD9D9D9)),
                                ),
                                hintText: 'PhoneNumber',
                                hintStyle:
                                const TextStyle(fontSize: 16.0, color: Color(0xff7E7979)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(AppPadding.p12),
                                  child: SvgPicture.asset(
                                      IconAssets.phone
                                  ),
                                )
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: GestureDetector(
                              onTap: () async{
                                birthday = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2000),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if(birthday == null){
                                  setState(() {
                                    selectedBirthday = true;
                                  });
                                }else{
                                  selectedBirthday = false;
                                  _signupStudent = StudentSignUpPatch(
                                    phoneNumber: _signupStudent.phoneNumber,
                                    birthDay: Timestamp.fromDate(birthday!).seconds,
                                    introduction: _signupStudent.introduction,
                                    country: _signupStudent.country,
                                  );
                                }
                                setState(() {
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 55,
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
                                        Icons.keyboard_arrow_down_outlined,
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
                              hint: Text(
                                'Introduction',
                                style: TextStyle(
                                    color: ColorManager.lightSteelBlue1,
                                    fontSize: 16.0
                                ),
                              ),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: ColorManager.lightSteelBlue2,
                                    ),
                                  ),
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
                              items: items.map((String items) {
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
