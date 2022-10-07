import 'package:flutter/material.dart';
import './my_separator.dart';
import 'package:provider/provider.dart';
import '../../models/student_account.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:im_stepper/stepper.dart';

import '../../provider/student_provider.dart';


class StudentSignUp extends StatefulWidget {
  static const routeName = '/student-signup';
  const StudentSignUp({Key? key}) : super(key: key);

  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
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
              )
            ],
          )
        )
    );
  }
}