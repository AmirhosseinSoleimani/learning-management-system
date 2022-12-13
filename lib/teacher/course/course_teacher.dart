import 'package:flutter/material.dart';

import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../presentation/dashboard_color_manager.dart';

class TeacherCourse extends StatefulWidget {
  const TeacherCourse({Key? key}) : super(key: key);

  @override
  State<TeacherCourse> createState() => _TeacherCourseState();
}

class _TeacherCourseState extends State<TeacherCourse> {
  String dropDownValue = 'All Courses';
  var items = ['All Courses', 'Publish', 'Draft'];
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Courses ',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.lightSteelBlue1)),
                      Text('/ Course Mana...',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.slateGray2,
                          )),
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
                height: 700,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: ColorManager.white),
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 60,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0))),
                          value: dropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
