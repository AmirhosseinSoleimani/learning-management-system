import 'package:flutter/material.dart';
import './student.dart';
import './teacher.dart';
import './seller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  final _passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();
  String dropDownValue = 'Student';

  var items = [
    'Student',
    'Teacher',
    'Seller'
  ];

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18.0,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Create Free Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Sign up using social networks',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: (){
                            debugPrint('facebook');
                          },
                          child: SvgPicture.asset('assets/images/facebook_icon.svg',
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                        width: 90.0,
                        height: 90.0,
                        padding: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: (){
                            debugPrint('google');
                          },
                          child: SvgPicture.asset('assets/images/google_icon.svg',
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            thickness: 1,
                            height: 10,
                          ),
                      ),
                    ),
                    const Text('OR'),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            thickness: 1,
                            height: 10,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                    'Please Selected Type Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: DropdownButton(
                    value: dropDownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items){
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue){
                      setState((){
                        dropDownValue = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide.none
                                ),
                                hintText: 'First Name'
                            ),
                            focusNode: _firstNameFocusNode,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_lastNameFocusNode);
                            },
                            validator: (String? value){
                              if(value!.isEmpty){
                                return 'Field is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide.none
                                ),
                                hintText: 'Last Name'
                            ),
                            keyboardType: TextInputType.name,
                            focusNode: _lastNameFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_emailFocusNode);
                            },
                            validator: (String? value){
                              if(value!.isEmpty){
                                return 'Field is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide.none
                                ),
                                hintText: 'Email'
                            ),
                            focusNode: _emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_passwordFocusNode);
                            },
                            validator: (String? value){
                              if(value!.isEmpty){
                                return 'Field is required';
                              }
                              else if(!value.contains('@')){
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
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
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide.none
                                ),
                                hintText: 'Password'
                            ),
                            obscureText: !_passwordVisible,
                            controller: _passwordController,
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
                  ),
                ),
                TextButton(
                    onPressed: (){
                      if(dropDownValue == 'Student'){
                        Navigator.pushNamed(context, StudentSignUp.routeName);
                      }
                      else if(dropDownValue == 'Teacher'){
                        Navigator.pushNamed(context, TeacherSignUp.routeName);
                      }
                      else{
                        Navigator.pushNamed(context, SellerSignUp.routeName);
                      }
                    },
                    child: Text(
                      'Next'
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
