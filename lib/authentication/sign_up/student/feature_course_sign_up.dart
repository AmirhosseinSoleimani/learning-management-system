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
          leading: Container(
            width: 100,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFF177FB0),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                data['name'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
