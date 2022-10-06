import 'package:flutter/material.dart';
import 'package:learning_management_system/models/general_account.dart';
import 'package:provider/provider.dart';
import './student.dart';
import './teacher.dart';
import './seller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/general_account.dart';
import '../../provider/student_provider.dart';

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
  bool isSelected = false;
  var _initValues = {
    'firstName': '',
    'lastName': '',
    'email': '',
    'password': '',
  };

  // final _passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();
  String dropDownValue = 'Student';

  var items = [
    'Student',
    'Teacher',
    'Seller'
  ];

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


  Future<void> _saveForm() async{
    final isValid = _form.currentState!.validate();
    if(!isValid){
      return ;
    }
    _form.currentState!.save();
    setState((){
      _isLoading = true;
    });
    try{
      await Provider.of<StudentProvider>(context,listen: false)
          .addGeneralStudent(_signupGeneral);
      Navigator.pushNamed(context, StudentSignUp.routeName);
    }catch(error){
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('an error occurred!'),
          content: const Text('Something went wrong'),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                          size: 18.0,
                          color: Colors.black,
                          ),
                      )
                    ],
                  ),
                ),
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
                            initialValue: _initValues['firstName'],
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
                              onSaved: (value){
                                _signupGeneral = GeneralAccount(
                                    id: _signupGeneral.id,
                                    firstName: value!,
                                    lastName: _signupGeneral.lastName,
                                    password: _signupGeneral.password,
                                    email: _signupGeneral.email,
                                    typeAccount: _signupGeneral.typeAccount,
                                );
                              }
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                              initialValue: _initValues['lastName'],
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
                              onSaved: (value){
                                _signupGeneral = GeneralAccount(
                                    id: _signupGeneral.id,
                                    firstName: _signupGeneral.firstName,
                                    lastName: value!,
                                    password: _signupGeneral.password,
                                    email: _signupGeneral.email,
                                    typeAccount: _signupGeneral.typeAccount
                                );
                              }
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            initialValue: _initValues['email'],
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
                            onSaved: (value){
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
                              onSaved: (value){
                                _signupGeneral = GeneralAccount(
                                    id: _signupGeneral.id,
                                    firstName: _signupGeneral.firstName,
                                    lastName: _signupGeneral.lastName,
                                    password: value!,
                                    email: _signupGeneral.email,
                                    typeAccount: _signupGeneral.typeAccount
                                );
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('I have read the Term & Conditions'),
                  leading: Checkbox(
                    value: isSelected,
                    onChanged: (value){
                      setState((){
                        isSelected = value!;
                      });
                    },
                  ),
                )
                ,
                TextButton(
                    onPressed: (){
                      if(isSelected){
                        if(dropDownValue == 'Student'){
                          _signupGeneral = GeneralAccount(
                              id: _signupGeneral.id,
                              firstName: _signupGeneral.firstName,
                              lastName: _signupGeneral.lastName,
                              password: _signupGeneral.password,
                              email: _signupGeneral.email,
                              typeAccount: 'Student',
                          );
                          _saveForm();
                        }
                        else if(dropDownValue == 'Teacher'){
                          Navigator.pushNamed(context, TeacherSignUp.routeName);
                          _signupGeneral = GeneralAccount(
                            id: _signupGeneral.id,
                            firstName: _signupGeneral.firstName,
                            lastName: _signupGeneral.lastName,
                            password: _signupGeneral.password,
                            email: _signupGeneral.email,
                            typeAccount: 'Teacher',
                          );
                        }
                        else{
                          Navigator.pushNamed(context, SellerSignUp.routeName);
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
                  style: isSelected ? TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue
                  ): TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.grey
                  ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400
                      ),
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
