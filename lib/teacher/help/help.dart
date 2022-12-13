import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../../provider/sign_in_provider.dart';
import '../presentation/dashboard_color_manager.dart';
import '../presentation/dashboard_styles_manager.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: AppSize.s20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.teacherDashboard);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Welcome ${Provider.of<SignInProvider>(context,listen: false).userInformation[0].firstName} ${Provider.of<SignInProvider>(context,listen: false).userInformation[0].lastName}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.slateGray2,
                          )
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'AnywhereWorks - dashboard',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.lightSteelBlue1
                        )
                      )
                    ],
                  ),
                  InkWell(
                    radius: 12,
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Container(
                      width: 55,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          border: Border.all(
                              color: ColorTeacherPanel.searchContainer,
                              width: AppSize.s1_5)),
                      child: const Icon(Icons.search),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 800.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: ColorManager.white
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorManager.white,
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.black,
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'How Can we Help You Today?',
                        style: TextStyle(
                          color: ColorManager.slateGray2,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorManager.lightSteelBlue2,
                            ),
                          ),
                          filled: true,
                          fillColor: ColorManager.lightSteelBlue3,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                width: 2, color: ColorManager.lightSteelBlue2),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconAssets.search
                            ),
                          ),
                          hintText: 'Enter Your Search Term Here...',
                          hintStyle: TextStyle(
                            color: ColorManager.lightSteelBlue1,
                            fontSize: 16.0,
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                      child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                ColorManager.primary,
                              ),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Search',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.white),
                                ),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ColorManager.lightSteelBlue3,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        color: ColorManager.lightSteelBlue3,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Learn How To...',
                              style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
