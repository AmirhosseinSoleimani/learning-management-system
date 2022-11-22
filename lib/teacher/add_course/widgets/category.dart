import 'package:flutter/material.dart';
import 'package:learning_management_system/data.dart';
import 'package:learning_management_system/provider/add_course.dart';
import 'package:provider/provider.dart';

import '../../../presentation/resources/color_manager.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  bool valueCheckBox = false;

  final _categoryFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Category',
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
            height: MediaQuery.of(context).size.height * 0.46,
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
                      focusNode: _categoryFocusNode,
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
                    padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                          itemCount: courses.length,
                          itemBuilder: (context,index) => Card(
                            elevation: 6,
                            child: ListTile(
                              title: Text(
                                '${courses[index]["name"]}'
                              ),
                              trailing: Checkbox(
                                value: valueCheckBox,
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    valueCheckBox = value!;
                                    Provider.of<AddCourseProvider>(context,listen: false).checkBoxCategory(valueCheckBox!, index);

                                  });
                                },
                              ),
                            ),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
