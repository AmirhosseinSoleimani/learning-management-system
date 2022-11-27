import 'package:flutter/material.dart';

import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';

class SettingAddCourse extends StatefulWidget {
  const SettingAddCourse({Key? key}) : super(key: key);

  @override
  State<SettingAddCourse> createState() => _SettingAddCourseState();
}

class _SettingAddCourseState extends State<SettingAddCourse> {
  Map<String,bool> levelCourse = {
    'Basic':true,
    'Elementary':false,
    'Advanced':false,
  };
  Map<String,bool> language = {
    'English':true,
    'Persian':false,
  };
  Map<String,bool> subTitle = {
    'English':true,
    'Persian':false,
  };
  bool workShop = false;
  DateTime date = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  bool selectedStartDate = false;
  bool selectedEndDate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: AppSize.s20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.addCoursePricing);
          },
        ),
        title: Image.asset(
          ImageAssets.epent,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.black, size: AppSize.s30),
      ),
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: ColorManager.lightSteelBlue2
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorManager.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    )
                  ]
              ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Time of Course:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.slateGray2
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: ColorManager.lightSteelBlue2
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            color: ColorManager.lightSteelBlue5,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:ColorManager.lightSteelBlue5,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            // focusNode: _priceFocusNode,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Divider(
                      thickness: 1.5,
                      height: 20,
                      color: ColorManager.lightSteelBlue5,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                            'Level of Course:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.slateGray2,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: ColorManager.lightSteelBlue2
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: ColorManager.lightSteelBlue5
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        'Basic',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                            color: ColorManager.black
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value: levelCourse['Basic'],
                                        activeColor: ColorManager.green,
                                        onChanged: (bool? value){
                                          setState(() {
                                            levelCourse['Basic'] = true;
                                            levelCourse['Elementary'] = false;
                                            levelCourse['Advanced'] = false;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: ColorManager.lightSteelBlue2
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: ColorManager.lightSteelBlue5
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        'Elementary',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                            color: ColorManager.black
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value: levelCourse['Elementary'],
                                        activeColor: ColorManager.green,
                                        onChanged: (value){
                                          setState(() {
                                            levelCourse['Basic'] = false;
                                            levelCourse['Elementary'] = true;
                                            levelCourse['Advanced'] = false;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: ColorManager.lightSteelBlue2
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: ColorManager.lightSteelBlue5
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        'Advanced',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                            color: ColorManager.black
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value: levelCourse['Advanced'],
                                        activeColor: ColorManager.green,
                                        onChanged: (value){
                                          setState(() {
                                            levelCourse['Basic'] = false;
                                            levelCourse['Elementary'] = false;
                                            levelCourse['Advanced'] = true;
                                          });
                                        }),
                                  ],
                                ),
                              )

                            ],
                          ),
                      )
                    ],
                  ),
                  SizedBox(
                    child: Divider(
                      thickness: 1.5,
                      height: 20,
                      color: ColorManager.lightSteelBlue5,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                          child: Text(
                            'Language:',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.black,
                            ),
                          ),
                      ),
                      Expanded(
                        flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        'English',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: ColorManager.black
                                        ),
                                      ),
                                      Checkbox(
                                          value: language['English'],
                                          activeColor: ColorManager.green,
                                          onChanged: (value){
                                            setState(() {
                                              language['English'] = true;
                                              language['Persian'] = false;

                                            });
                                          },
                                      ),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      'Persian',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: ColorManager.black
                                      ),
                                    ),
                                    Checkbox(
                                      value: language['Persian'],
                                      activeColor: ColorManager.green,
                                      onChanged: (value){
                                        setState(() {
                                          language['English'] = false;
                                          language['Persian'] = true;

                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                      )
                    ],
                  ),
                  SizedBox(
                    child: Divider(
                      thickness: 1.5,
                      height: 20,
                      color: ColorManager.lightSteelBlue5,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'SubTitle:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'English',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.black
                                    ),
                                  ),
                                  Checkbox(
                                    value: subTitle['English'],
                                    activeColor: ColorManager.green,
                                    onChanged: (value){
                                      setState(() {
                                        subTitle['English'] = true;
                                        subTitle['Persian'] = false;

                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Persian',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.black
                                    ),
                                  ),
                                  Checkbox(
                                    value: subTitle['Persian'],
                                    activeColor: ColorManager.green,
                                    onChanged: (value){
                                      setState(() {
                                        subTitle['English'] = false;
                                        subTitle['Persian'] = true;

                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    child: Divider(
                      thickness: 1.5,
                      height: 20,
                      color: ColorManager.lightSteelBlue5,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'This course has a class or workshop',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.black
                              ),
                            ),
                            Checkbox(
                              value: workShop,
                              activeColor: ColorManager.green,
                              onChanged: (bool? value){
                                setState(() {
                                  workShop = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    child: Divider(
                      thickness: 1.5,
                      height: 20,
                      color: ColorManager.lightSteelBlue5,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Registration time:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Start Date:',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.lightSteelBlue1
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: ColorManager.lightSteelBlue2
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: ColorManager.lightSteelBlue5,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async{
                                          startDate = await showDatePicker(
                                            context: context,
                                            initialDate: date,
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if(startDate == null){
                                            setState(() {
                                              selectedStartDate = true;
                                            });
                                          }
                                          else{
                                            setState(() {
                                              selectedStartDate = false;
                                            });
                                          }

                                      },
                                      child: Center(
                                        child: (startDate == null|| selectedStartDate == true) ? Text(
                                          '--/--/--',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.slateGray2
                                          ),
                                        ) : Text(
                                          '${startDate!.year}/${startDate!.month}/${startDate!.day}',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.slateGray2
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'End Date:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.lightSteelBlue1
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: ColorManager.lightSteelBlue2
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: ColorManager.lightSteelBlue5,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async{
                                        if(startDate != null){
                                          endDate = await showDatePicker(
                                            context: context,
                                            initialDate: startDate!,
                                            firstDate: startDate!,
                                            lastDate: DateTime(2100),
                                          );
                                          if(endDate == null){
                                            setState(() {
                                              selectedEndDate = true;
                                            });
                                          }
                                          else{
                                            setState(() {
                                              selectedEndDate = false;
                                            });
                                          }
                                        }else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                    'Please Enter StartDate',
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight: FontWeight.w400,
                                                        color: ColorManager.error
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )));
                                        }
                                      },
                                      child: Center(
                                        child: (endDate == null || startDate == null || selectedEndDate == true) ? Text(
                                          '--/--/--',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.slateGray2
                                          ),
                                        ) : Text(
                                          '${endDate!.year}/${endDate!.month}/${endDate!.day}',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.slateGray2
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Routes.addCourseSetting);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            ColorManager.primary,
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(50.0)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Done',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.done,
                              color: ColorManager.white,
                              size: 30,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
