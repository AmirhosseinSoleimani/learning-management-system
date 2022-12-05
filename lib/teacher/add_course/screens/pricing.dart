import 'package:flutter/material.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';

class Pricing extends StatefulWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _offFocusNode = FocusNode();
  final FocusNode _offCodeFocusNode = FocusNode();
  String dropdownValue = '\$';
  bool offSelected = false;
  DateTime date = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  DateTime? startOffDate;
  DateTime? endOffDate;
  bool selectedStartDate = false;
  bool selectedEndDate = false;
  bool selectedOffStartDate = false;
  bool selectedOffEndDate = false;




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
            Navigator.of(context).pushReplacementNamed(Routes.addCourseTitle);
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
          physics: const NeverScrollableScrollPhysics(),
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: ColorManager.lightSteelBlue2
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorManager.lightSteelBlue5,
                    ),
                    child: Wrap(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.lightSteelBlue5,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                child: PopupMenuButton(
                                  onSelected: (String? value){
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: ColorManager.lightSteelBlue2
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: ColorManager.lightSteelBlue5,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 6.0),
                                            child: Text(
                                                dropdownValue,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.slateGray2
                                              ),
                                            ),
                                          ),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                    itemBuilder: (context) => ['Dollars','تومان'].map(
                                            (value) => PopupMenuItem(
                                                value: value,
                                                child: Text(
                                                  value
                                                ),
                                            ),
                                    ).toList()
                                ),
                              ),
                              Flexible(
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
                                      hintText: 'Price: ',
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color:ColorManager.slateGray2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    focusNode: _priceFocusNode,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none
                        ),
                        hintText: 'Off:',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color:ColorManager.slateGray2,
                          fontWeight: FontWeight.w400,
                        ),
                        suffix: Text(
                            '%',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.slateGray2
                          ),
                        )
                      ),
                      focusNode: _offFocusNode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
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
                                }else{
                                  selectedStartDate = false;
                                }
                                setState(() {
                                });
                              },
                              child: Center(
                                  child: (startDate == null || selectedStartDate == true) ? Text(
                                    'Start Date: --/--/--',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.slateGray2
                                    ),
                                  ) : Text(
                                    '${startDate!.year}/${startDate!.month}/${startDate!.day}',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.slateGray2
                                    ),
                                  ),
                              ),
                            ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
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
                                  }else{
                                    setState(() {
                                      selectedEndDate = false;
                                    });
                                  }
                                  setState(() {
                                  });
                                }
                                else{
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
                                  'End Date: --/--/--',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.slateGray2
                                  ),
                                ):Text(
                                  '${endDate!.year}/${endDate!.month}/${endDate!.day}',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.slateGray2
                                  ),
                              ),
                            ),
                        ),
                      ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: (){
                                setState(() {
                                  offSelected = !offSelected;
                                });
                              },
                              child: Text(
                                '+ Off Code',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: (offSelected == false) ? ColorManager.lightSteelBlue1:ColorManager.green
                                ),
                              ),
                          ),
                        ),
                        if(offSelected) VerticalDivider(
                          color: ColorManager.lightSteelBlue2,
                          thickness: 2,
                        ),
                        (offSelected == true) ? Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Off:',
                                      style: TextStyle(
                                        color: ColorManager.lightSteelBlue1,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 40,
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
                                          suffix: Text(
                                              '%',
                                            style: TextStyle(
                                              color: ColorManager.slateGray2,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0,
                                            ),
                                          )
                                        ),
                                        autofocus: true,
                                        focusNode: _offCodeFocusNode,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Start Date:',
                                      style: TextStyle(
                                          color: ColorManager.lightSteelBlue1,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 40,
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
                                          startOffDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2100),
                                          );
                                          if(startOffDate == null){
                                            setState(() {
                                              selectedOffStartDate = true;
                                            });
                                          }else{
                                            setState(() {
                                              selectedOffStartDate = false;
                                            });
                                          }
                                          setState(() {
                                          });
                                        },
                                        child: Center(
                                          child: (startOffDate == null || selectedOffStartDate == true) ? Text(
                                            '--/--/--',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.slateGray2
                                            ),
                                          ):Text(
                                          '${startOffDate!.year}/${startOffDate!.month}/${startOffDate!.day}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.slateGray2
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        ),
                                      ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'End Data:',
                                      style: TextStyle(
                                          color: ColorManager.lightSteelBlue1,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: ColorManager.lightSteelBlue2
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: ColorManager.lightSteelBlue5,
                                      ),
                                      child: GestureDetector(
                                        onTap: ()async{
                                          if(startOffDate != null){
                                            endOffDate = await showDatePicker(
                                              context: context,
                                              initialDate: startOffDate!,
                                              firstDate: startOffDate!,
                                              lastDate: DateTime(2100),
                                            );
                                            if(endOffDate == null){
                                              setState(() {
                                                selectedOffEndDate = true;
                                              });
                                            }else{
                                              selectedOffEndDate = false;
                                            }
                                            setState(() {
                                            });
                                          }
                                          else{
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
                                          child: (endOffDate == null || startOffDate == null || selectedOffEndDate == true) ? Text(
                                            '--/--/--',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.slateGray2
                                            ),
                                          ):Text(
                                            '${endOffDate!.year}/${endOffDate!.month}/${endOffDate!.day}',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.slateGray2
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                            :Expanded(
                              flex: 2,
                              child: Container(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Routes.addCourseSection);
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
                              'Next',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.arrow_forward,
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
