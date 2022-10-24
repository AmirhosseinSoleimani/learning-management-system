import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_up/student/feature_course_sign_up.dart';
import 'package:learning_management_system/authentication/sign_up/student/stepper.dart';
import 'package:learning_management_system/data.dart';
import '../../../store/screens/home_page.dart';
import '../../drawer.dart';

class DialogBoxSignUp extends StatefulWidget {
  const DialogBoxSignUp({Key? key}) : super(key: key);

  @override
  State<DialogBoxSignUp> createState() => _DialogBoxSignUpState();
}

class _DialogBoxSignUpState extends State<DialogBoxSignUp> {

  final _form = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();

  final _initValues = {'name': '', 'lastName': '', 'bio': ''};


  @override
  Widget build(BuildContext context) {
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
                      Stack(
                        children: [
                          Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height * 0.38,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Positioned(
                            top: 120,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff177FB0),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: const CustomizeStepper(),
                            ),
                          ),
                          Positioned(
                            bottom: 102.0,
                            left: -40.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 35.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/favourite.png',
                                  width: 150.0,
                                  height: 150.0,
                                  alignment: Alignment.topLeft,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Favourite',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3F3D56)),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        child: Form(
                          key: _form,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              initialValue: _initValues['name'],
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
                              focusNode: _nameFocusNode,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_lastNameFocusNode);
                              },
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
                                  onTap: () {  },
                                ),
                            )
                          ),
                        ),
                      )
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
