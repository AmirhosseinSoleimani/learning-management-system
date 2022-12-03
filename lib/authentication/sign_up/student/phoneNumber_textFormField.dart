import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';
import '../../../provider/teacher_provider.dart';



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
                borderRadius: BorderRadius.circular(AppSize.s10),
                color: ColorManager.white,
                border: Border.all(width: 2, color: ColorManager.primary)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Row(
                children: [
                  SvgPicture.asset(
                  IconAssets.phone
              ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          height: 28,
                          width: 12,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: AppPadding.p8),
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 18.0, color: ColorManager.black),
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
                              setState(() {
                                phoneNumber = value;
                              });
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
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
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
                    width: AppSize.s10,
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
                                setState(() {
                                  phoneNumber = '$phoneNumber$value';
                                });
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
                        ),
                      ),
                      SizedBox(
                        height: 18,
                        width: 12,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                            onSaved: (num4) {

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
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
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
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
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
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
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
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
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
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
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
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
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
                              setState(() {
                                phoneNumber = '$phoneNumber$value';
                              });
                            }
                          },
                          onFieldSubmitted: (value){
                             Provider.of<TeacherProvider>(context,listen: false).phoneNumberTextFormField = phoneNumber;
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
          )
        : TextFormField(
            onTap: () {
              setState(() {
                isSelected = true;
              });
            },
            initialValue: (Provider.of<TeacherProvider>(context,listen: false).isLocation)? '${Provider.of<TeacherProvider>(context,listen: false).phoneNumberTextFormField}': '',
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    width: 2,
                    color: ColorManager.lightSteelBlue2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xffD9D9D9)),
                ),
                hintText: 'PhoneNumber',
                hintStyle:
                    const TextStyle(fontSize: 16.0, color: Color(0xff7E7979)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: SvgPicture.asset(
                    IconAssets.phone
                  ),
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
          );
  }
}
