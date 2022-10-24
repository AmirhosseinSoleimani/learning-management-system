import 'package:flutter/material.dart';
import '../my_separator.dart';

class CustomizeStepper extends StatelessWidget {
  const CustomizeStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                width: 25,
                height: 35,
                child: CircleAvatar(
                  backgroundColor: Color(0xff5DBF23),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 35,
                child: MySeparator(
                  color: Color(0xffD9D9D9),
                ),
              ),
              SizedBox(
                width: 25,
                height: 35,
                child: CircleAvatar(
                  backgroundColor: Color(0xff5DBF23),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 35,
                child: MySeparator(
                  color: Color(0xffD9D9D9),
                ),
              ),
              SizedBox(
                width: 25,
                height: 35,
                child: CircleAvatar(
                  backgroundColor: Color(0xff5DBF23),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 35,
                child: MySeparator(
                  color: Color(0xffD9D9D9),
                ),
              ),
              SizedBox(
                width: 25,
                height: 35,
                child: CircleAvatar(
                    backgroundColor: Color(0xff5DBF23),
                    child: null),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                'Information',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 13.0,
              ),
              Text(
                'Information',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                'Favourite',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 252),
                child: SizedBox(
                  width: 60,
                  height: 1,
                  child: Divider(
                    thickness: 5,
                    color: Color(0xff5DBF23),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
