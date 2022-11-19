import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_management_system/authentication/sign_up/teacher/teacher_resume.dart';
import 'package:learning_management_system/models/teacher_signUp_model.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:learning_management_system/provider/teacher_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../provider/student_provider.dart';
import '../../../store/drawer.dart';
import '../../customize_stepper_second_information.dart';


class ThirdInformationStudentSignUp extends StatefulWidget {

  const ThirdInformationStudentSignUp({Key? key}) : super(key: key);

  @override
  State<ThirdInformationStudentSignUp> createState() => _ThirdInformationStudentSignUpState();
}

class _ThirdInformationStudentSignUpState extends State<ThirdInformationStudentSignUp> {


  File? _image;
  final _form = GlobalKey<FormState>();
  final _bioFocusNode = FocusNode();


  final _initValues = {
    'workHistory': '',
    'bio': ''
  };

  var _teacherSignUp = TeacherSignUpPatch(
    bio: '',
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
      await Provider.of<TeacherProvider>(context, listen: false).replaceTeacherThirdSignUp(context, _teacherSignUp);

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
            Navigator.of(context).pushReplacementNamed(Routes.teacherInformationSecondRoutes);
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
      ):Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
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
                    vertical: AppPadding.p10,
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
                      child: const CustomizeSecondStepperInformation()
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                if(!isKeyboard) Text(
                  'Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
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
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.38,
                          child: const TeacherResume()),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p10,
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
                                        width: 2,
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
                                  _teacherSignUp = TeacherSignUpPatch(
                                    bio: value!,
                                  );
                                },
                              ),
                            ),
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
                              _saveForm();
                              print(Provider.of<TeacherProvider>(context,listen: false).teacherAccountPatch[0].firstName);
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
