import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/student_signUp_model.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../provider/student_provider.dart';
import '../../../store/drawer.dart';


class StudentSignUp extends StatefulWidget {

  const StudentSignUp({Key? key}) : super(key: key);

  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  final _passwordFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  bool isSelected = false;
  final _initValues = {
    'user_name': '',
    'password': '',
  };


  final _form = GlobalKey<FormState>();

  bool _passwordVisible = false;

  var _signupStudent = StudentSignUpPost(
    password: '',
    userName: '',
  );

  var _isLoading = false;

  var userNameError = false;

  bool userNameValidator = false;

  bool passwordValidator = false;

  bool passwordShort = false;

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
      await Provider.of<StudentProvider>(context, listen: false).studentSignUpPost(context,_signupStudent);
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
    if(Provider.of<StudentProvider>(context,listen: false).userNameError.contains('This User Name is Exit')){
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
            size: 20.0,
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
        iconTheme: IconThemeData(color: ColorManager.black, size: 30.0),
      ),
      endDrawer: const DrawerAppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.white,
      body: (_isLoading) ? Center(
        child: cubeGrid,
      ) : Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
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
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                SizedBox(
                  height: (userNameError == false && userNameValidator == false && passwordValidator == false && passwordShort == false) ? MediaQuery.of(context).size.height * 0.20:(userNameError == true && userNameValidator == true) ?  MediaQuery.of(context).size.height * 0.28 : MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          TextFormField(
                            initialValue: _initValues['userName'],
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: ColorManager.lightSteelBlue2,
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
                                hintText: 'User Name',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: ColorManager.lightSteelBlue1
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(AppPadding.p12),
                                  child:  SvgPicture.asset(IconAssets.personIcon),
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
                                setState(() {
                                  userNameValidator = true;
                                });
                                return 'Please enter a User name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _signupStudent = StudentSignUpPost(
                                password: _signupStudent.password,
                                userName: value,
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
                            height: 10.0,
                          ),
                          TextFormField(
                              initialValue: _initValues['password'],
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: ColorManager.lightSteelBlue2,
                                    ),
                                  ),
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
                                          BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: ColorManager.lightSteelBlue2
                                  ),
                              ),
                                  hintText: 'Password'),
                              obscureText: !_passwordVisible,
                              // controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    passwordValidator = true;
                                  });
                                  return 'Please enter a Password';
                                } else if (value.length < 8) {
                                  setState(() {
                                    passwordShort = true;
                                  });
                                  return 'Password is too short!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _signupStudent = StudentSignUpPost(
                                  password: value,
                                  userName: _signupStudent.userName,
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
                        await _saveForm();
                        errorView();
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
                      child: Text(
                        'Sign Up',
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
                            left: 10.0, right: 20.0),
                        child: Divider(
                          color: ColorManager.lightSteelBlue2,
                          thickness: 1,
                          height: 10,
                        ),
                      ),
                    ),
                    Text(
                      'Or Sign Up With',
                      style: TextStyle(
                        color: ColorManager.lightSteelBlue1
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 20.0),
                          child: Divider(
                            color: ColorManager.lightSteelBlue2,
                            thickness: 1,
                            height: 10,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                if(!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              border: Border.all(
                                  width: 1, color: ColorManager.lightSteelBlue2),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
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
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                              border: Border.all(
                                  width: 1, color: ColorManager.lightSteelBlue2),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
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
                              width: 40,
                              height: 40,
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
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do have an account?',
                        style: TextStyle(
                          color: ColorManager.lightSteelBlue1,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(Routes.signIn);
                        },
                        child: Text(
                          'Sign In',
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
