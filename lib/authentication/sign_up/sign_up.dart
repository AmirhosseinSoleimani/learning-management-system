import 'package:flutter/material.dart';
import 'package:learning_management_system/models/general_account.dart';
import 'package:provider/provider.dart';
import './student.dart';
import './teacher.dart';
import './seller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/general_account.dart';
import '../../provider/student_provider.dart';
import '../sign_in/drawer.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  bool isSelected = false;
  final _initValues = {
    'firstName': '',
    'lastName': '',
    'email': '',
    'password': '',
  };

  // final _passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  bool _passwordVisible = false;

  var _signupGeneral = GeneralAccount(
    typeAccount: '',
    id: '',
    firstName: '',
    lastName: '',
    password: '',
    email: '',
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
          .addGeneralStudent(_signupGeneral);
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
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
          'assets/images/epent.png',
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 30.0),
      ),
      endDrawer: const DrawerAppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!isKeyboard) Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                      'assets/images/epent_body.png',
                      width: 120.0,
                      height: 120.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
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
                  height: 20.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
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
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                size: 28.0,
                                color: Color(0xff7E7979),
                              )
                            ),
                            focusNode: _emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
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
                              _signupGeneral = GeneralAccount(
                                id: _signupGeneral.id,
                                firstName: _signupGeneral.firstName,
                                lastName: _signupGeneral.lastName,
                                password: _signupGeneral.password,
                                email: value!,
                                typeAccount: _signupGeneral.typeAccount,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
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
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    size: 28.0,
                                      color: Color(0xff7E7979),
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
                              textInputAction: TextInputAction.next,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                } else if (value.length < 6) {
                                  return 'Password is too short!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _signupGeneral = GeneralAccount(
                                    id: _signupGeneral.id,
                                    firstName: _signupGeneral.firstName,
                                    lastName: _signupGeneral.lastName,
                                    password: value!,
                                    email: _signupGeneral.email,
                                    typeAccount:
                                        _signupGeneral.typeAccount);
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 87.0
                  ),
                  child: TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, StudentSignUp.routeName);
                        if (isSelected) {
                          if (dropDownValue == 'Student') {
                            _signupGeneral = GeneralAccount(
                              id: _signupGeneral.id,
                              firstName: _signupGeneral.firstName,
                              lastName: _signupGeneral.lastName,
                              password: _signupGeneral.password,
                              email: _signupGeneral.email,
                              typeAccount: 'Student',
                            );
                            _saveForm();
                          } else if (dropDownValue == 'Teacher') {
                            Navigator.pushNamed(
                                context, TeacherSignUp.routeName);
                            _signupGeneral = GeneralAccount(
                              id: _signupGeneral.id,
                              firstName: _signupGeneral.firstName,
                              lastName: _signupGeneral.lastName,
                              password: _signupGeneral.password,
                              email: _signupGeneral.email,
                              typeAccount: 'Teacher',
                            );
                          } else {
                            Navigator.pushNamed(
                                context, SellerSignUp.routeName);
                            _signupGeneral = GeneralAccount(
                              id: _signupGeneral.id,
                              firstName: _signupGeneral.firstName,
                              lastName: _signupGeneral.lastName,
                              password: _signupGeneral.password,
                              email: _signupGeneral.email,
                              typeAccount: 'Seller',
                            );
                          }
                        }
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)
                        ),
                      )
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
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
                Padding(
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
                              'assets/images/Google.svg',
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
                        onTap: () {
                          debugPrint('hhh');
                        },
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
                              'assets/images/LinkedIn.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
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
                        onPressed: () {},
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xff177FB0),
                              fontSize: 22.0,
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
