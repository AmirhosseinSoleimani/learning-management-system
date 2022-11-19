import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management_system/authentication/customize_stepper_information.dart';
import 'package:learning_management_system/authentication/sign_up/student/phoneNumber_textFormField.dart';
import 'package:learning_management_system/authentication/sign_up/teacher/third_teacher_information.dart';
import 'package:learning_management_system/models/teacher_signUp_model.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import 'package:learning_management_system/provider/teacher_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../store/drawer.dart';



class SecondInformationTeacher extends StatefulWidget {
  const SecondInformationTeacher({Key? key}) : super(key: key);

  @override
  State<SecondInformationTeacher> createState() =>
      _SecondInformationTeacherState();
}

class _SecondInformationTeacherState extends State<SecondInformationTeacher> {



  bool dateSelect = false;

  final _form = GlobalKey<FormState>();


  var _teacherSignUp = TeacherSignUpPatch(
    address: '',
    financial: '',
    cardNumber: 0,
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
      await Provider.of<TeacherProvider>(context, listen: false).replaceTeacherSecondSignUp(
        context,_teacherSignUp
      );

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
                if(!isKeyboard) Padding(
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
                if(!isKeyboard) Padding(
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
                if(!isKeyboard) Text(
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
                            _teacherSignUp = TeacherSignUpPatch(
                              address: value,
                              financial: '',
                              cardNumber: 0,
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
                                color: ColorManager.lightSteelBlue1,
                            ),
                            borderRadius: BorderRadius.circular(AppSize.s10)
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacementNamed(Routes.googleMap);
                            },
                            child:(Provider.of<TeacherProvider>(context).isLocation) ? Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(AppPadding.p12),
                                  child: SvgPicture.asset(IconAssets.location),
                                ),
                                Text(
                                  Provider.of<TeacherProvider>(context).defaultLatitude.toString()
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                    Provider.of<TeacherProvider>(context).defaultLongitude.toString()
                                ),
                              ],
                            ): Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(AppPadding.p12),
                                  child: SvgPicture.asset(IconAssets.location),
                                ),
                                Text(
                                    'Add Location',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: ColorManager.lightSteelBlue1,
                                    fontWeight: FontWeight.w400
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                        const SizedBox(
                          height: AppSize.s20,
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
                              hintText: 'financial information',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: ColorManager.lightSteelBlue1
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
                            _teacherSignUp = TeacherSignUpPatch(
                              address: '',
                              financial: value,
                              cardNumber: 0,
                            );
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
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
                              hintText: 'Via Card Number',
                              hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: ColorManager.lightSteelBlue1
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: SvgPicture.asset(IconAssets.visaCard),
                              )
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _teacherSignUp = TeacherSignUpPatch(
                              address: '',
                              financial: '',
                              cardNumber: int.tryParse(value!),
                            );
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
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
                        _saveForm();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primary,
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)
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
        ),
      ),
    );
  }

}
