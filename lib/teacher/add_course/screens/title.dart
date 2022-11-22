import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../provider/add_course.dart';
import '../../../store/drawer.dart';
import '../widgets/learn_things.dart';

class CourseTitle extends StatefulWidget {
  const CourseTitle({Key? key}) : super(key: key);

  @override
  State<CourseTitle> createState() => _CourseTitleState();
}

class _CourseTitleState extends State<CourseTitle> {
  final _titleFocusNode = FocusNode();

  final _subtitleFocusNode = FocusNode();

  final _descriptionFocusNode = FocusNode();

  String? fileNameVideo;

  bool isSelected = false;

  Future<File> saveFile(PlatformFile file) async {
    final appStorage = await getApplicationSupportDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }



  final _form = GlobalKey<FormState>();


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
            Navigator.of(context).pushReplacementNamed(Routes.addCourseLayout);
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
      endDrawer: const DrawerAppBar(),
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.white,
      body: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: ColorManager.lightSteelBlue2),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Title:',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorManager.lightBlue4,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorManager.lightSteelBlue2),
                                ),
                              ),
                              focusNode: _titleFocusNode,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Subtitle:',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorManager.lightBlue4,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorManager.lightSteelBlue2),
                                ),
                              ),
                              focusNode: _subtitleFocusNode,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: (Provider.of<AddCourseProvider>(context).learnThings.isEmpty)?
                    MediaQuery.of(context).size.height * 0.56
                    :MediaQuery.of(context).size.height * 0.81,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: ColorManager.lightSteelBlue2),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Description:',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: TextFormField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorManager.lightBlue4,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorManager.lightSteelBlue2),
                                ),
                              ),
                              focusNode: _descriptionFocusNode,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Things we learn in this course:',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.black),
                            ),
                          ),
                          const LearnThings(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: ColorManager.lightSteelBlue2),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Course introduction video',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.black
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0, color: ColorManager.lightSteelBlue2),
                                borderRadius: BorderRadius.circular(10.0),
                              color: ColorManager.lightBlue4
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      IconAssets.video
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TextButton(
                                                style: TextButton.styleFrom(
                                                    padding: const EdgeInsets.all(20),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5),
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: ColorManager.lightSteelBlue2),
                                                    ),
                                                    backgroundColor: ColorManager.lightSteelBlue2
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    isSelected = true;
                                                  });
                                                  final result =
                                                  await FilePicker.platform.pickFiles(
                                                    allowMultiple: true,
                                                    type: FileType.video,
                                                  );
                                                  if (result == null) return;

                                                  final file = result.files.first;
                                                  setState(() {
                                                    fileNameVideo = file.name;
                                                  });
                                                  // final newFile = await saveFile(file);
                                                  // openFile(result.files);
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      color: ColorManager.lightSteelBlue1,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Upload Video',
                                                      style: TextStyle(color: ColorManager.lightSteelBlue1),
                                                    )
                                                  ],
                                                )))
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
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<AddCourseProvider>(context).learnThings.length;
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
                              'Get Start',
                              style: TextStyle(
                                  fontSize: 22.0,
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
