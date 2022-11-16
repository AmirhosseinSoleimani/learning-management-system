import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import '../presentation/resources/color_manager.dart';


class CustomizeStepperInformation extends StatelessWidget {
  const CustomizeStepperInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 35,
                        child: CircleAvatar(
                          backgroundColor: ColorManager.green,
                          child: CircleAvatar(
                            backgroundColor: ColorManager.green,
                            child: Icon(
                              Icons.done,
                              color: ColorManager.white,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      SizedBox(
                        width: 50,
                        height: 1,
                        child: Divider(
                          thickness: 5,
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 35,
                        child: CircleAvatar(
                          backgroundColor: ColorManager.green,
                          child: null,
                        ),
                      ),
                      Text(
                        'Information',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      SizedBox(
                        width: 75,
                        height: 1,
                        child: Divider(
                          thickness: 5,
                          color: ColorManager.green,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 35,
                        child: CircleAvatar(
                          backgroundColor: ColorManager.lightSteelBlue2,
                          child: null,
                        ),
                      ),
                      Text(
                        'Information',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      SizedBox(
                        width: 50,
                        height: 1,
                        child: Divider(
                          thickness: 5,
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 35,
                        child: CircleAvatar(
                            backgroundColor: ColorManager.lightSteelBlue2,
                            child: null
                        ),
                      ),
                      Text(
                        'Favourite',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      SizedBox(
                        width: 50,
                        height: 1,
                        child: Divider(
                          thickness: 5,
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 43.5,
            left: 37.5,
            child: SizedBox(
              width: 55,
              height: 35,
              child: Divider(
                thickness: 2.0,
                color: ColorManager.lightSteelBlue2,
              ),
            ),
          ),
          Positioned(
            top: 43.5,
            left: 117.5,
            child: SizedBox(
              width: 70,
              height: 35,
              child: Divider(
                thickness: 2.0,
                color: ColorManager.lightSteelBlue2,
              ),
            ),
          ),
          Positioned(
            top: 43.5,
            left: 200.5,
            child: SizedBox(
              width: 70,
              height: 35,
              child: Divider(
                thickness: 2.0,
                color: ColorManager.lightSteelBlue2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
