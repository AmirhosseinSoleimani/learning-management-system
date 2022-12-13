import 'package:flutter/material.dart';
import 'package:learning_management_system/provider/section_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../provider/lesson_provider.dart';

class AddLesson extends StatefulWidget {
  const AddLesson({Key? key}) : super(key: key);

  @override
  State<AddLesson> createState() => _AddLessonState();
}

class _AddLessonState extends State<AddLesson> {
  final FocusNode _titleFocusNode = FocusNode();
  String? titleSection;
  bool selectedSection = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
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
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                hintText: 'Title Lesson : ',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color:ColorManager.slateGray2,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              autofocus: true,
              keyboardType: TextInputType.text,
              focusNode: _titleFocusNode,
              textInputAction: TextInputAction.done,
              onChanged: (value){
                setState(() {
                  titleSection = value;
                });
              },
              onFieldSubmitted: (value){
                Provider.of<LessonProvider>(context,listen: false).addLessonTitle(context,titleSection!);
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
              onPressed: () {
                if(titleSection != null){
                  Provider.of<LessonProvider>(context,listen: false).addLessonTitle(context,titleSection!);
                  Navigator.of(context).pop();
                }
                else{
                  setState(() {});
                }
              },
              style: ButtonStyle(
                  backgroundColor: (titleSection != null) ? MaterialStateProperty.all<Color>(
                    ColorManager.primary,
                  ) : MaterialStateProperty.all<Color>(
                    ColorManager.lightSteelBlue2,
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
                child: (titleSection != null) ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add',
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
                ):
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.lightSteelBlue1),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.done,
                      color: ColorManager.lightSteelBlue1,
                      size: 30,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
