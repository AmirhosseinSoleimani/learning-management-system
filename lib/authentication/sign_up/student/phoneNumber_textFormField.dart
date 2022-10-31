import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_management_system/provider/student_provider.dart';
import 'package:provider/provider.dart';



class PhoneNumberTextFormField extends StatefulWidget {
  const PhoneNumberTextFormField({Key? key}) : super(key: key);

  @override
  State<PhoneNumberTextFormField> createState() =>
      _PhoneNumberTextFormFieldState();
}

class _PhoneNumberTextFormFieldState extends State<PhoneNumberTextFormField> {

  String? phoneNumber;


  bool isSelected = false;

  final _phoneNumberFocusNode = FocusNode();

  final _initValues = {
    'phoneNumber': '',
  };

  @override
  Widget build(BuildContext context) {
    return (isSelected)
        ? Container(
            height: 55.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.blue)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          )),
                      const SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
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
                          onSaved: (num1) {
                            setState(() {
                              phoneNumber = '$num1';
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onSaved: (num2) {
                            setState(() {
                              phoneNumber = '$phoneNumber$num2';
                            });
                          },
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
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onSaved: (num3) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num3';
                              });
                            }),
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
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
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num4) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num4';
                              });
                            }
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
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num5) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num5';
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num6) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num6';
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num7) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num7';
                              });
                            }
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
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num8) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num8';
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num9) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num9';
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num10) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num10';
                              });
                            }
                        ),
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num11) {
                              setState(() {
                                phoneNumber = '$phoneNumber$num11';
                                Provider.of<StudentProvider>(context,listen: false).phoneNumberTextFormField = phoneNumber;
                              });
                            }
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        : TextFormField(
            onTap: () {
              setState(() {
                isSelected = true;
              });
            },
            initialValue: _initValues['phoneNumber'],
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xffD9D9D9)),
                ),
                hintText: 'PhoneNumber',
                hintStyle:
                    const TextStyle(fontSize: 16.0, color: Color(0xff7E7979)),
                prefixIcon: const Icon(
                  Icons.phone_android_outlined,
                  size: 28.0,
                  color: Color(0xff7E7979),
                )),
            focusNode: _phoneNumberFocusNode,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Field is required';
              }
              return null;
            },
          );
  }
}
