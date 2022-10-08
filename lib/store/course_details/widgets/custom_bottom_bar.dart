import 'package:flutter/material.dart';
import '../../../constant/colors.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      padding: const EdgeInsets.fromLTRB(25, 0, 15, 15),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.05),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0,0)
            )
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'price',
                style: TextStyle(
                    fontSize: 13.0,
                    color: labelColor,
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                '\$100',
                style: TextStyle(
                    fontSize: 18.0,
                    color: labelColor,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){},
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: primary
                ),
                child: const Center(
                  child: Text(
                    'Buy now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
