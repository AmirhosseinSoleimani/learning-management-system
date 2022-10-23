import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../drawer.dart';
import '../my_separator.dart';
import 'package:date_time_picker/date_time_picker.dart';


class SecondInformationStudent extends StatefulWidget {
  static const routeName = '/second_student_information_signup';
  const SecondInformationStudent({Key? key}) : super(key: key);

  @override
  State<SecondInformationStudent> createState() => _SecondInformationStudentState();
}

class _SecondInformationStudentState extends State<SecondInformationStudent> {

  bool isSelected = false;
  final _form = GlobalKey<FormState>();
  final _phoneNumberFocusNode = FocusNode();

  final _initValues = {
    'phoneNumber': '',
  };

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
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 35.0
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                      'assets/images/epent_only_logo.png',
                      width: 120.0,
                      height: 120.0,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff177FB0),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0)
                        )
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff5DBF23),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                height: 35,
                                child: MySeparator(
                                  color: Color(0xffD9D9D9),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff5DBF23),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                height: 35,
                                child: MySeparator(color: Color(0xffD9D9D9),),
                              ),
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff5DBF23),
                                  child: null,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                height: 35,
                                child: MySeparator(color: Color(0xffD9D9D9),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                    backgroundColor: Color(0xffD9D9D9),
                                    child: null
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                'Information',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: 13.0,
                              ),
                              Text(
                                'Information',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'Favourite',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 90
                                ),
                                child: SizedBox(
                                  width: 75,
                                  height: 1,
                                  child: Divider(
                                    thickness: 5,
                                    color: Color(0xff5DBF23),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Information',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3F3D56)
                  ),
                ),
                const SizedBox(
                  height: 10.0,
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
                          (isSelected) ? Container(
                            height: 55.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    width: 2,
                                    color: Colors.blue
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    child: Icon(
                                      Icons.phone_android_outlined,
                                      size: 28.0,
                                      color: Color(0xff7E7979),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                          height: 28,
                                          width: 12,
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              '+',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black
                                              ),
                                            ),
                                          )
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          autofocus: true,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18,
                                        width: 12,
                                        child: TextFormField(
                                          onChanged: (value){
                                            if(value.length == 1){
                                              FocusScope.of(context).nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter.digitsOnly,
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ) :TextFormField(
                            onTap: (){
                              setState((){
                                isSelected = true;
                              });
                            },
                            initialValue: _initValues['phoneNumber'],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffD9D9D9)
                                  ),
                                ),
                                hintText: 'PhoneNumber',
                                hintStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xff7E7979)
                                ),
                                prefixIcon: const Icon(
                                  Icons.phone_android_outlined,
                                  size: 28.0,
                                  color: Color(0xff7E7979),
                                )
                            ),

                            focusNode: _phoneNumberFocusNode,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Field is required';
                              }
                              return null;
                            },
                            onSaved: (value) {
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DateTimePicker(
                  initialValue: '',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
