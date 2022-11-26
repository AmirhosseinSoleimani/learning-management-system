import 'package:flutter/material.dart';

class CheckBoxCategory extends StatefulWidget {
  const CheckBoxCategory({Key? key,this.data}) : super(key: key);

  final data;
  @override
  State<CheckBoxCategory> createState() => _CheckBoxCategoryState();
}

class _CheckBoxCategoryState extends State<CheckBoxCategory> {

  List<String> dataName = [];

  bool valueCheckBox = false;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: ListTile(
        title: Text(
            '${widget.data["name"]}'
        ),
        trailing: Checkbox(
          value: valueCheckBox,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              valueCheckBox = !valueCheckBox;
            });
          },
        ),
      ),
    );
  }
}
