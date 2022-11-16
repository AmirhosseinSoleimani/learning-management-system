import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/teacher_signUp_post_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/string_teacherSignUp/string_teacherSignUp.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../provider/student_provider.dart';
import '../../../provider/teacher_provider.dart';
import '../../../store/drawer.dart';


class TeacherSignUp extends StatefulWidget {


  const TeacherSignUp({Key? key}) : super(key: key);

  @override
  State<TeacherSignUp> createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  final _passwordFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  bool isSelected = false;
  final _initValues = {
    'userName': '',
    'password': '',
  };

  final _form = GlobalKey<FormState>();

  bool _passwordVisible = false;

  var _teacherSignUpPost = TeacherSignUpPost(
    password: '',
    userName: '',
  );

  var _isLoading = false;

  bool userNameError = false;

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
      await Provider.of<TeacherProvider>(context, listen: false).teacherSignUpPost(context, _teacherSignUpPost);
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

  void errorView() async{
    if(Provider.of<TeacherProvider>(context,listen: false).userNameError.contains('This User Name is Exit')){
      setState(() {
        userNameError = true;
      });
    }
  }

  @override
  void dispose() {
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
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
            Navigator.of(context).pushReplacementNamed(Routes.homePage);
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
      ) : Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p16
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                      ImageAssets.epentBody,
                      width: 120.0,
                      height: 120.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                const Text(
                  TeacherSignUpString.teacherSignUpTitle1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                SizedBox(
                  height: (userNameError == false) ? MediaQuery.of(context).size.height * 0.25:MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p10),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          TextFormField(
                            initialValue: _initValues['userName'],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(AppSize.s10),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: ColorManager.lightSteelBlue2
                                  ),
                                ),
                                hintText: TeacherSignUpString.textFormField1,
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: ColorManager.lightSteelBlue1
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(AppPadding.p12),
                                  child: SvgPicture.asset(IconAssets.personIcon),
                                )
                            ),
                            focusNode: _userNameFocusNode,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return TeacherSignUpString.validator;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _teacherSignUpPost = TeacherSignUpPost(
                                userName: value!,
                                password: _teacherSignUpPost.password,
                              );
                            },
                          ),
                          if (userNameError == true) Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Text(
                              'This username is exist, try another',
                              style: TextStyle(
                                  color: ColorManager.error
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s20,
                          ),
                          TextFormField(
                              initialValue: _initValues['password'],
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible =
                                        !_passwordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: ColorManager.lightSteelBlue1,
                                      size: 28.0,
                                    ),
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(AppPadding.p12),
                                    child: SvgPicture.asset(
                                      IconAssets.passwordIcon
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: ColorManager.lightSteelBlue2
                                    ),
                                  ),
                                  hintText: TeacherSignUpString.textFormField2),
                              obscureText: !_passwordVisible,
                              // controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                } else if (value.length < 6) {
                                  return 'Password is too short!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _teacherSignUpPost = TeacherSignUpPost(
                                  password: value!,
                                  userName: _teacherSignUpPost.userName,
                                );
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 87.0
                  ),
                  child: TextButton(
                      onPressed: () async{
                        // Navigator.pushNamed(context, InformationTeacherSignUp.routeName);
                        await _saveForm();
                        errorView();
                        print(userNameError);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            ColorManager.primary,
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSize.s50)
                              )
                          )
                      ),
                      child: Text(
                        TeacherSignUpString.textButtonSignUp,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white
                        ),
                      )
                  ),
                ),
                if(!isKeyboard) const SizedBox(
                  height: 20.0,
                ),
                if(!isKeyboard) Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: AppPadding.p10, right: AppPadding.p20),
                        child: Divider(
                          color: ColorManager.lightSteelBlue2,
                          thickness: 1,
                          height: AppSize.s10,
                        ),
                      ),
                    ),
                    Text(
                      TeacherSignUpString.teacherSignUpSubTitle1,
                      style: TextStyle(
                          color: ColorManager.lightSteelBlue1,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: AppPadding.p10, right: AppPadding.p20),
                          child: Divider(
                            color: ColorManager.lightSteelBlue2,
                            thickness: 1,
                            height: AppSize.s10,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                if(!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p10,
                    vertical: AppPadding.p10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: AppSize.s60,
                          height: AppSize.s60,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            border: Border.all(
                                width: 1, color: ColorManager.lightSteelBlue2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.5),
                                blurRadius: 12.0, // soften the shadow
                                spreadRadius: 6.0, //extend the shadow
                                offset: const Offset(
                                  0, // Move to right 5  horizontally
                                  0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              IconAssets.google,
                              width: AppSize.s40,
                              height: AppSize.s40,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s30,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: AppSize.s60,
                          height: AppSize.s60,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            border: Border.all(
                                width: 1, color: ColorManager.lightSteelBlue2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.5),
                                blurRadius: 12.0, // soften the shadow
                                spreadRadius: 6.0, //extend the shadow
                                offset: const Offset(
                                  0, // Move to right 5  horizontally
                                  0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],

                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              IconAssets.linkedin,
                              width: AppSize.s40,
                              height: AppSize.s40,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if(!isKeyboard) const SizedBox(
                  height: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p10,
                    vertical: AppPadding.p10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TeacherSignUpString.teacherSignUpTitle2,
                        style: TextStyle(
                          color: ColorManager.lightSteelBlue1,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          TeacherSignUpString.textButtonSignIn,
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
