import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/colors.dart';


class CategoryBox extends StatelessWidget {
  const CategoryBox({Key? key,this.date}) : super(key: key);
  final date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1,1),

                  )
                ]
            ),
            child: SvgPicture.asset(date["icon"],
              width: 30.0,
              height: 30.0,
              color: textColor,
            )
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          date["name"],
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}
