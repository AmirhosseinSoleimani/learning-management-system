import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../presentation/resources/color_manager.dart';

class EditSection extends StatefulWidget {
  const EditSection({Key? key,required this.index}) : super(key: key);
  final int index;

  @override
  State<EditSection> createState() => _EditSectionState();
}

class _EditSectionState extends State<EditSection> {
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
              initialValue: '',
              decoration: InputDecoration(
                filled: true,
                fillColor:ColorManager.lightSteelBlue5,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: ColorManager.slateGray2
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
                // Provider.of<CourseSectionProvider>(context,listen: false).addCourseSectionTitle(titleSection!);
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
                  // Provider.of<CourseSectionProvider>(context,listen: false).addCourseSectionTitle(titleSection!);
                  Navigator.of(context).pop();
                }
                else{
                  setState(() {});
                  Navigator.of(context).pop();
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
                child: Row(
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
                )
              )),
        ],
      ),
    );
  }
}
