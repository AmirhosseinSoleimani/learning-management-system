import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../provider/student_provider.dart';
import '../../../store/drawer.dart';
import '../../models/signIn_model.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../provider/sign_in_provider.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/sign-in';

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _passwordFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  bool isSelected = false;
  final _initValues = {
    'user_name': '',
    'password': '',
  };


  final _form = GlobalKey<FormState>();

  bool _passwordVisible = false;


  var _isLoading = false;

  final _userNameError = false;

  var signIn = SignInModel(
      userName: '',
      password: '');

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
      await Provider.of<SignInProvider>(context,listen: false).signIn(signIn);
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
  void dispose() {
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    // _passwordController.dispose();
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
        iconTheme: const IconThemeData(color: Colors.black, size: 30.0),
      ),
      endDrawer: const DrawerAppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      body: (_isLoading) ? Center(
        child: cubeGrid,
      ) : Padding(
        padding: const EdgeInsets.all(15.0),
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
                      vertical: 15.0
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
                  height: 10.0,
                ),
                const Text(
                  'Welcome back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          TextFormField(
                            initialValue: _initValues['user_name'],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffD9D9D9)
                                  ),
                                ),
                                hintText: 'User Name',
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
                            focusNode: _userNameFocusNode,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              signIn = SignInModel(
                                  userName: value!,
                                  password: signIn.password);
                            },
                          ),
                          if (_userNameError) Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Text(
                              Provider.of<StudentProvider>(context).userNameError,
                              style: TextStyle(
                                  color: ColorManager.error
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s10,
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
                                      color: const Color(0xff7E7979),
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
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Color(0xffD9D9D9)
                                    ),
                                  ),
                                  hintText: 'Password'),
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
                                signIn = SignInModel(
                                    userName: signIn.userName,
                                    password: value!);
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
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF)
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
                        child: const Divider(
                          color: Color(0xffD9D9D9),
                          thickness: 1,
                          height: 10,
                        ),
                      ),
                    ),
                    const Text(
                      'Or Sign Up With',
                      style: TextStyle(
                          color: Color(0xff7E7979)
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Color(0xffD9D9D9),
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
                            color: const Color(0xFFffffff),
                            border: Border.all(
                                width: 1, color: const Color(0xffD9D9D9)),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
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
                            color: const Color(0xFFffffff),
                            border: Border.all(
                                width: 1, color: const Color(0xffD9D9D9)),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
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
                      const Text(
                        'Do have an account?',
                        style: TextStyle(
                          color: Color(0xff7E7979),
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(Routes.studentSignUp);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color(0xff177FB0),
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
