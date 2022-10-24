import 'package:flutter/material.dart';

class FeatureCourseSignUp extends StatefulWidget {
  final data;

  const FeatureCourseSignUp({Key? key,this.data}) : super(key: key);

  @override
  State<FeatureCourseSignUp> createState() => _FeatureCourseSignUpState();
}

class _FeatureCourseSignUpState extends State<FeatureCourseSignUp> {

  bool isSelected = false;

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
            decoration: BoxDecoration(
              color: (isSelected) ? const Color(0xFF5DBF23) : const Color(0xFF177FB0),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                widget.data['name'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
                ),
              ),
            ),
          ),
          trailing: TextButton(
            onPressed: (){
              setState((){
                isSelected = !isSelected;
              });
            },
            child:(isSelected)? const Text(
              ' Following',
              style: TextStyle(
                  color: Color(0xff7E7979)
              ),
            ) :
            const Text(
              '+ Follow',
              style: TextStyle(
                color: Color(0xff7E7979)
              ),
            ),
          ),
        ),

      ),
    );
  }
}
