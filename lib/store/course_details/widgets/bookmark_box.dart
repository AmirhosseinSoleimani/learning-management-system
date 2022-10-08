import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/colors.dart';

class BookMarkBox extends StatelessWidget {
  BookMarkBox({Key? key,required this.onBookMark,this.isBookMark = false}) : super(key: key);
  final GestureTapCallback onBookMark;
  final bool isBookMark;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBookMark,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: isBookMark ? primary:Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(0.05),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(1,1)
              ),
            ]
        ),
        child: SvgPicture.asset('assets/icons/bookmark.svg',
          color: isBookMark ? Colors.white:primary,
          width: 25.0,
          height: 25.0,
        ),
      ),
    );
  }
}
