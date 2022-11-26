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
  String dropdownValue = '\$';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:ColorManager.lightSteelBlue5,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            width: 2,
                            color: ColorManager.lightSteelBlue2
                        )
                    ),
                    labelText: 'Off: ',
                    labelStyle: TextStyle(
                      fontSize: 22,
                      color:ColorManager.slateGray2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(),
                    ),
                    Expanded(
                      child: TextFormField(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
