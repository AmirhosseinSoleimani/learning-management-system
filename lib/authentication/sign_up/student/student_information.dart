import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_management_system/models/student_signUp_model.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../provider/student_provider.dart';
import '../../../store/drawer.dart';
import '../../customize_stepper_information.dart';

class InformationStudentSignUp extends StatefulWidget {

  const InformationStudentSignUp({Key? key}) : super(key: key);

  @override
  State<InformationStudentSignUp> createState() => _InformationStudentSignUpState();
}

class _InformationStudentSignUpState extends State<InformationStudentSignUp> {


  File? _image;
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
    'email': '',
    'bio': ''
  };

  var _signupStudent = StudentSignUpPatch(
    firstName: '',
    lastName: '',
    email: '',
    bio: '',
    gender: 1,
  );

  var _emailError = false;

  var _isLoading = false;

  // Future<void> _saveForm() async {
  //   final isValid = _form.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   _form.currentState!.save();
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     await Provider.of<StudentProvider>(context, listen: false)
  //         .replaceStudentAccount(context,_signupStudent);
  //
  //   } catch (error) {
  //     await showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text('an error occurred!'),
  //         content: const Text('Something went wrong'),
  //         actions: [
  //           TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('Okay'))
  //         ],
  //       ),
  //     );
  //   }
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }



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
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: 20.0,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.studentSignUp);
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
                    decoration: const BoxDecoration(
                        color: Color(0xff177FB0),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)
                        )
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: const CustomizeStepperInformation()
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
                    physics: const NeverScrollableScrollPhysics(),
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
                            _signupStudent = StudentSignUpPatch(
                              firstName: value,
                              lastName: _signupStudent.lastName,
                              email: _signupStudent.email,
                              bio: _signupStudent.bio,
                              gender: _signupStudent.gender,
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
                            _signupStudent = StudentSignUpPatch(
                              firstName: _signupStudent.firstName,
                              lastName: value,
                              email: _signupStudent.email,
                              bio: _signupStudent.bio,
                              gender: _signupStudent.gender,
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
                            _signupStudent = StudentSignUpPatch(
                              firstName: _signupStudent.firstName,
                              lastName: _signupStudent.lastName,
                              email: value,
                              bio: _signupStudent.bio,
                              gender: _signupStudent.gender,
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
                          Column(
                            children: [
                              SizedBox(
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
                                        _signupStudent = StudentSignUpPatch(
                                          firstName: _signupStudent.firstName,
                                          lastName: _signupStudent.lastName,
                                          email: _signupStudent.email,
                                          bio: _signupStudent.bio,
                                          gender: 1,
                                        );
                                      });
                                    }
                                    else if(newValue == 'Female'){
                                    {
                                      setState(() {
                                        dropDownValue = newValue!;
                                        _signupStudent = StudentSignUpPatch(
                                          firstName: _signupStudent.firstName,
                                          lastName: _signupStudent.lastName,
                                          email: _signupStudent.email,
                                          bio: _signupStudent.bio,
                                          gender: 0,
                                        );
                                      });
                                    }
                                    }
                                    else{
                                      setState(() {
                                        dropDownValue = newValue!;
                                        _signupStudent = StudentSignUpPatch(
                                          firstName: _signupStudent.firstName,
                                          lastName: _signupStudent.lastName,
                                          email: _signupStudent.email,
                                          bio: _signupStudent.bio,
                                          gender: 3,
                                        );
                                      });
                                    }
                                  },
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
                                      _signupStudent = StudentSignUpPatch(
                                        firstName: _signupStudent.firstName,
                                        lastName: _signupStudent.lastName,
                                        email: _signupStudent.email,
                                        bio: value,
                                        gender: _signupStudent.gender,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
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
                          ),
                        ],
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
                              _emailError = true;
                              Future.delayed(const Duration(seconds: 5), () {
                                setState((){
                                  _emailError = false;
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
