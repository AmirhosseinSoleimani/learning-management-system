import 'package:flutter/material.dart';

import '../../../presentation/resources/color_manager.dart';

class AddSection extends StatefulWidget {
  const AddSection({Key? key}) : super(key: key);

  @override
  State<AddSection> createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  FocusNode _titleFocusNode = FocusNode();

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
                hintText: 'Title Section : ',
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
              onFieldSubmitted: (value){
                
              },
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
              onPressed: () {},
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
                ),
              )),
        ],
      ),
    );
  }
}
