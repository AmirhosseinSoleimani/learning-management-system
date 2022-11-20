import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_up/student/feature_course_sign_up.dart';
import 'package:learning_management_system/data.dart';
import 'package:provider/provider.dart';
import '../../../models/student_account.dart';
import '../../../provider/student_provider.dart';
import '../../../store/drawer.dart';

class DialogBoxSignUp extends StatefulWidget {
  const DialogBoxSignUp({Key? key}) : super(key: key);

  @override
  State<DialogBoxSignUp> createState() => _DialogBoxSignUpState();
}

class _DialogBoxSignUpState extends State<DialogBoxSignUp> {

  final _form = GlobalKey<FormState>();
  final _favouriteCourse = FocusNode();
  final _initValues = {'favouriteCourse': ''};
  var _signupStudent = StudentAccount(
    firstName: '',
    lastName: '',
    password: '',
    email: '',
    phoneNumber: '',
    birthDay: Timestamp.fromDate(DateTime.now()).seconds,
    bio: '',
    gender: 0,
    introduction: '',
    country: '',
    favouriteCourse: '', userName: '',
  );


  @override
  Widget build(BuildContext context) {
    final studentAccount = Provider.of<StudentProvider>(context);
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          child: Card(
            elevation: 8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0
                        ),
                        child: Text(
                          'Favourite',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3F3D56)),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        child: Form(
                          key: _form,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              enabled: false,
                              initialValue: _initValues['favouriteCourse'],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Color(0xffD9D9D9)),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color(0xff7E7979),
                                    size: 28.0,
                                  )
                              ),
                              focusNode: _favouriteCourse,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.search,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFffffff),
                            border: Border.all(
                              width: 2,
                              color: const Color(0xffD9D9D9),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ListView.builder(
                              itemCount: features.length,
                                itemBuilder: (context,index) => FeatureCourseSignUp(
                                  data: features[index],
                                ),
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 87.0, left: 87.0, bottom: 20.0),
                        child: TextButton(
                            onPressed: () {

                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xff177FB0),
                                ),
                                shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50.0),
                                    ),
                                ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Text(
                                'Close',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
