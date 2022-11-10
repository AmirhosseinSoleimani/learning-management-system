import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget getButton({required String text,
    required BuildContext context,
    required Color color,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    double radius = 0,
    Color borderColor = Colors.black,
    double width = 30,
    double height = 30}){
  return SizedBox(
    height: height,
    width: width,
    child: TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: borderColor)
          )
        )
      ),
      onPressed: (){},
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                color: color,
                fontWeight: fontWeight
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getIconButton(String svg,Color color,double width,double height){
  return IconButton(
    onPressed: (){},
    icon: SvgPicture.asset(
      svg,
      width: width,
      height: height,
      color: color,
    ),
  );
}