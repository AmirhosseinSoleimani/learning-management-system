import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/widgets.dart';
import '../../extension/extension.dart';

TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();
bool remember = false;

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _passwordFocusNode = FocusNode();
  bool _passwordVisible = false;

  String dropDownValue = 'English';
  var items = ['English', 'فارسی'];
  @override
  Widget build(BuildContext context) {

    final _formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.14,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0))),
                      value: dropDownValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                    ),
                  ),
                  Image.asset(
                    'assets/images/epent.PNG',
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.08,
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Sign In Your Account',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email or Phone number',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: Colors.white12,
                                width: 2
                              ),
                          ),
                          hintText: 'Email address or phone number'
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      // onFieldSubmitted: (value) {
                      //   FocusScope.of(context).requestFocus(_passwordFocusNode);
                      // },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        } else if (!value.contains('@')) {
                          return 'Invalid email!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ) ,
                    const Text(
                      'Password',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState((){
                                  _passwordVisible =! _passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: Colors.white12,
                                  width: 2
                              ),
                            ),
                            hintText: 'Password'
                        ),
                        obscureText: !_passwordVisible,
                        // controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.next,
                        validator: (String? value){
                          if(value!.isEmpty){
                            return 'Field is required';
                          }
                          else if(value.length < 6){
                            return 'Password is too short!';
                          }
                          return null;
                        },
                    )
                  ],
                ),
              ),
            ).padding9.center,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: remember,
                                  onChanged: (value){
                                    remember = value!;
                                  },
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    color: Color(0xff5DBF23),
                                    fontSize: 16
                                  ),
                                )
                              ],
                            ),
                            TextButton(
                              onPressed: (){},
                              child: const Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.0
                                ),
                              ),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: (){},
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xff177FB0)
                            ),
                          child: Row(
                            children: const [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          )
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0
                          ),
                          child: Text(
                            'Don\'t Have Account?',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xff177FB0)),
                          child: const Text(
                            'Create Account',
                            style:
                            TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: const Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 5,
                  ),
                ),
              ),
              const Text('SIGN IN WITH'),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 5,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
