import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeatureCourseSignUp extends StatelessWidget {
  final data;
  final GestureTapCallback onTap;

  FeatureCourseSignUp({Key? key,this.data,required this.onTap}) : super(key: key);

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
          leading: Text(
            data['name']
          ),
        ),
      ),
    );
  }
}
