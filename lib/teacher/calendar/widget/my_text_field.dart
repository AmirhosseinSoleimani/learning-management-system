import 'package:flutter/material.dart';
import '../../presentation/dashboard_value_manager.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      this.controller,
      required this.title,
      this.widget,
      this.onTap});

  final String title;
  final TextEditingController? controller;
  final Widget? widget;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              autofocus: false,
              readOnly: widget == null ? false : true,
              decoration: InputDecoration(
                  hintText: title,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSize.s14))),
            ),
          ),
          widget == null
              ? Container()
              : Container(
                  child: widget,
                )
        ],
      ),
    );
  }
}
