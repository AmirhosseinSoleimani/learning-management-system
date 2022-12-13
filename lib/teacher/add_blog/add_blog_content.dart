import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../provider/add_courses_provider.dart';
import '../add_course/widgets/category.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../add_course/widgets/tag.dart';

class AddBlogContent extends StatefulWidget {
  const AddBlogContent({Key? key}) : super(key: key);

  @override
  State<AddBlogContent> createState() => _AddBlogContentState();
}

class _AddBlogContentState extends State<AddBlogContent> {
  Map<String,bool> subTitle = {
    'Publish':true,
    'Draft':false,
  };
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
            Navigator.of(context).pushReplacementNamed(Routes.addBlogLayout);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Course Title',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.slateGray2),
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextFormField(
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
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'The Text Of The Article',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.slateGray2),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: ColorManager.slateGray2, backgroundColor: ColorManager.lightSteelBlue3,
                      side: BorderSide(
                          color: ColorManager.lightSteelBlue2, width: 2.0)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(IconAssets.camera),
                      ),
                      Text(
                        'Add Photo',
                        style: TextStyle(
                          color: ColorManager.lightSteelBlue1,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
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
                ),
                maxLines: 10,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Short description of the course',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.slateGray2),
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextFormField(
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
                ),
                maxLines: 3,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Add Voice',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.slateGray2),
                  ),
                  Text(
                    'Add Photo',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.slateGray2),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.0,
                              color: ColorManager.lightSteelBlue2,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(IconAssets.volume),
                            ),
                            Text(
                              'add audio',
                              style: TextStyle(
                                  color: ColorManager.lightSteelBlue1,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.0,
                              color: ColorManager.lightSteelBlue2,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(IconAssets.photo),
                            ),
                            Text(
                              'add Photo',
                              style: TextStyle(
                                  color: ColorManager.lightSteelBlue1,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 155,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: ColorManager.lightSteelBlue2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Category(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: (Provider.of<AddCourseProvider>(context).tag.isEmpty)
                    ? 140
                    : 320,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.0, color: ColorManager.lightSteelBlue2),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Text(
                        'Tag:',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.slateGray2),
                      ),
                    ),
                    Builder(builder: (BuildContext context) => const Tag()),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: ColorManager.lightSteelBlue2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Publish',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.black),
                          ),
                          Checkbox(
                            value: subTitle['Publish'],
                            activeColor: ColorManager.green,
                            onChanged: (value) {
                              setState(() {
                                subTitle['Publish'] = true;
                                subTitle['Draft'] = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Draft',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.black),
                          ),
                          Checkbox(
                            value: subTitle['Draft'],
                            activeColor: ColorManager.green,
                            onChanged: (value) {
                              setState(() {
                                subTitle['Publish'] = false;
                                subTitle['Draft'] = true;
                              });
                            },
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
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.teacherDashboard);
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
    );
  }
}
