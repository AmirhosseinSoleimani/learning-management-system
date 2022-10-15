import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_management_system/authentication/sign_up/student_address.dart';
import './my_separator.dart';
import 'package:provider/provider.dart';
import '../../provider/student_provider.dart';


class StudentSignUp extends StatefulWidget {
  static const routeName = '/student-signup';
  const StudentSignUp({Key? key}) : super(key: key);

  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {

  var _isLoading = false;
  final _form = GlobalKey<FormState>();
  var pinCode = '';



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
      Navigator.pushNamed(context, StudentAddress.routeName);
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
    setState((){
      _isLoading = false;
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
        ) :
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                          const SizedBox(
                            width: 35,
                            height: 35,
                            child: CircleAvatar(
                              child: Icon(Icons.done,
                                size: 20.0,
                              ),
                            ),
                          ),
                              const SizedBox(
                                width: 60,
                                height: 35,
                                  child: MySeparator(color: Colors.black,),
                              ),
                              SizedBox(
                                width: 35,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  child: const Text(
                                      '2',
                                    style: TextStyle(
                                      color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                                height: 35,
                                child: MySeparator(color: Colors.black,),
                              ),
                              SizedBox(
                                width: 35,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  child: const Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 60,
                                height: 35,
                                child: MySeparator(color: Colors.black,),
                              ),
                              SizedBox(
                                width: 35,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  child: const Text(
                                    '4',
                                    style: TextStyle(
                                      color: Colors.black
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                              SizedBox(
                                width: 60,
                                height: 45,
                                child: Text(
                                  'Type Account',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                                height: 45,
                                child: MySeparator(color: Colors.white,),
                              ),
                              SizedBox(
                                width: 60,
                                height: 45,
                                child: Text(
                                  'Verify Email'
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                height: 45,
                                child: MySeparator(color: Colors.white,),
                              ),
                              SizedBox(
                                width: 60,
                                height: 45,
                                child: Text(
                                  'Address'
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                height: 45,
                                child: MySeparator(color: Colors.white,),
                              ),
                              SizedBox(
                                width: 60,
                                height: 45,
                                child: Text(
                                  'Favourite'
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      const Icon(Icons.email,
                        size: 50.0,
                      ),
                      const Text(
                        'Verify your email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Please enter the 5 digital code send to',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(
                        Provider.of<StudentProvider>(context).studentAccount[0].email != null ?
                        Provider.of<StudentProvider>(context).studentAccount[0].email :
                        'ff',
                        // Provider.of<StudentProvider>(context).studentAccount[0].email,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Form(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                    onChanged: (value){
                                      if(value.length == 1){
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.0)
                                        )
                                    ),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onSaved: (pin1){
                                      pinCode = '$pin1';
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                      onChanged: (value){
                                        if(value.length == 1){
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0)
                                          )
                                      ),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return;
                                        }
                                        return null;
                                      },
                                      onSaved: (pin2){
                                        pinCode = '$pinCode$pin2';
                                      }
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                      onChanged: (value){
                                        if(value.length == 1){
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0)
                                          )
                                      ),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return;
                                        }
                                        return null;
                                      },
                                      onSaved: (pin3){
                                        pinCode = '$pinCode$pin3';
                                      }
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                      onChanged: (value){
                                        if(value.length == 1){
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0)
                                          )
                                      ),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return;
                                        }
                                        return null;
                                      },
                                      onSaved: (pin4){
                                        pinCode = '$pinCode$pin4';
                                      }
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                      onChanged: (value){
                                        if(value.length == 1){
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0)
                                          )
                                      ),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return;
                                        }
                                        return null;
                                      },
                                      onSaved: (pin5){
                                        pinCode = '$pinCode$pin5';
                                      }
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0
                    ),
                    child: TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, StudentAddress.routeName);
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        )
    );
  }
}