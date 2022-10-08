import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constant/colors.dart';
import '../screens/lesson_item_page.dart';
import '../../../data.dart';

class LessonItem extends StatelessWidget {
  LessonItem({Key? key,this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(LessonItemPage.routeName,arguments: data);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(.07),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1,1)
              ),
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: CachedNetworkImage(
                width: 70,
                height: 70,
                imageBuilder: (context,imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover
                      )
                  ),
                ),
                imageUrl: data["image"],
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["name"],
                    style: const TextStyle(
                        color: textColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule_outlined,
                        size: 20.0,
                        color: labelColor,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        data["duration"],
                        style: const TextStyle(
                          color: labelColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: labelColor,
              size: 15.0,
            )
          ],
        ),
      ),
    );
  }
}
