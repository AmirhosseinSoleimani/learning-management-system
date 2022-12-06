import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/provider/student_provider.dart';
import 'package:provider/provider.dart';

class FeatureCourseSignUp extends StatefulWidget {
  final String categoryTitle;

  const FeatureCourseSignUp({Key? key, required this.categoryTitle}) : super(key: key);

  @override
  State<FeatureCourseSignUp> createState() => _FeatureCourseSignUpState();
}

class _FeatureCourseSignUpState extends State<FeatureCourseSignUp> {
  bool isSelected = false;


  void courseFavourite() {
    if (isSelected) {
      Provider.of<StudentProvider>(context,listen: false).favouriteCourseList.add(widget.categoryTitle);
    } else if (isSelected == false) {
      Provider.of<StudentProvider>(context,listen: false).favouriteCourseList.remove(widget.categoryTitle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 3.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFffffff),
          border: Border.all(
            width: 2,
            color: const Color(0xffD9D9D9),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListTile(
          leading: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: (isSelected)
                  ? const Color(0xFF5DBF23)
                  : const Color(0xFF177FB0),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                widget.categoryTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 14.0),
              ),
            ),
          ),
          trailing: TextButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
                courseFavourite();
              });
            },
            child: (isSelected)
                ? const Text(
                    ' Following',
                    style: TextStyle(color: Color(0xff7E7979)),
                  )
                : const Text(
                    '+ Follow',
                    style: TextStyle(color: Color(0xff7E7979)),
                  ),
          ),
        ),
      ),
    );
  }
}
