import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:learning_management_system/provider/teacher_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/color_manager.dart';

class TeacherResume extends StatefulWidget {
  const TeacherResume({Key? key}) : super(key: key);

  @override
  State<TeacherResume> createState() => _TeacherResumeState();
}

class _TeacherResumeState extends State<TeacherResume> {
  String? fileNameResume;
  String? fileNameVideo;
  String firstDropDownItem = 'English';
  final List languageItems = [
    'English',
    'French',
    'Germany',
    'Turkey',
    'Persian',
  ];
  bool _isSelected = false;
  int lanIndex = 0;
  bool _isLoadingResume = false;
  bool _isLoadingVideo = false;

  Future<File> saveFile(PlatformFile file) async {
    final appStorage = await getApplicationSupportDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }

  final cubeGrid = SpinKitWave(
    size: 20.0,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? ColorManager.slateGray2 : ColorManager.lightSteelBlue2,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p10, vertical: AppPadding.p10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(

                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(AppPadding.p12),
                            child: SvgPicture.asset(
                              IconAssets.workHistory,
                            ),
                          ),
                          hintText: 'Write your work history',
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: ColorManager.lightSteelBlue1
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                               borderSide: BorderSide(
                                 width: 2,
                                  color: ColorManager.lightSteelBlue2
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextButton(
                                onPressed: () async {
                                  setState(() {
                                    _isSelected = true;
                                  });
                                  final result = await FilePicker.platform.pickFiles(
                                    allowMultiple: true,
                                  );
                                  if (result == null) return;

                                  final file = result.files.first;
                                  setState(() {
                                    fileNameResume = file.name;
                                    _isLoadingResume = true;
                                  });

                                  await Provider.of<TeacherProvider>(context,listen: false).uploadResumeFile(file.path!,context);
                                  setState(() {
                                    _isLoadingResume = false;
                                  });
                                },
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(AppSize.s10),
                                        side: BorderSide(
                                            width: 2, color: ColorManager.lightSteelBlue2),
                                    ),
                                ),
                                child: (_isLoadingResume)? Center(child: cubeGrid,) :Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        IconAssets.resume,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Resume",
                                        style: TextStyle(color: ColorManager.lightSteelBlue1),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          const SizedBox(
                            width: AppSize.s10,
                          ),
                          Expanded(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isSelected = true;
                                    Provider.of<TeacherProvider>(context,listen: false).language = firstDropDownItem;
                                  });
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) => Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 250,
                                            child: CupertinoPicker(
                                                backgroundColor: ColorManager.white,
                                                itemExtent: 64,
                                                onSelectedItemChanged: (index) {
                                                  setState(() {
                                                    lanIndex = index;
                                                  });
                                                },
                                                children: languageItems
                                                    .map((item) =>
                                                    Center(child: Text(item)))
                                                    .toList()),
                                          ),
                                        ],
                                      ));
                                },
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(AppPadding.p16),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(AppSize.s10),
                                        side: const BorderSide(
                                            width: 2, color: Color(0xffD9D9D9)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                      IconAssets.language
                                    ),
                                    (_isSelected == false)
                                        ? const Text(
                                      'Languages',
                                      style: TextStyle(color: Color(0xff7E7979)),
                                    )
                                        : Text(
                                      languageItems[lanIndex],
                                      style: const TextStyle(
                                          color: Color(0xff7E7979)),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xff7E7979),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                      if (_isSelected)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: (fileNameResume != null)
                                  ? Text(fileNameResume!)
                                  : null),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: const BorderSide(
                                              width: 2, color: Color(0xffD9D9D9)))),
                                  onPressed: () async {
                                    setState(() {
                                      _isSelected = true;
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
                                      _isLoadingVideo = true;
                                    });
                                    await Provider.of<TeacherProvider>(context,listen: false).uploadVideoFile(file.path!,context);
                                    setState(() {
                                      _isLoadingVideo = false;
                                    });
                                  },
                                  child: (_isLoadingVideo)? Center(child: cubeGrid,):Row(
                                    children: const [
                                      Icon(
                                        Icons.ondemand_video,
                                        color: Color(0xff7E7979),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Upload your biography video',
                                        style: TextStyle(color: Color(0xff7E7979)),
                                      )
                                    ],
                                  )))
                        ],
                      ),
                      if (_isSelected)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: (fileNameVideo != null)
                                  ? Text(fileNameVideo!)
                                  : null),
                        ),
                    ],
                  ),
                ))
          ]);
  }
}