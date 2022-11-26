import 'package:flutter/material.dart';

import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';

class Pricing extends StatelessWidget {
  const Pricing({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              TextFormField(

              ),
              TextFormField(),
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
    );
  }
}
