import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constant/colors.dart';


class QuizItem extends StatelessWidget {
  const QuizItem({
    Key? key,
    required this.imageUrl,
    required this.onTap,
    required this.title,
    required this.time,
    required this.calendar,


  }) : super(key: key);
  final String imageUrl;
  final String title;
  final DateTime time;
  final String calendar;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300.0,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1,1)
              )
            ]
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  imageUrl
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    getAttribute(calendar.toString(),Icons.calendar_today,labelColor),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule_outlined,
                          size: 18.0,
                          color: labelColor,
                        ),
                        const SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          '${time.minute}:${time.second}',
                          style: const TextStyle(color: labelColor,fontSize: 13.0),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
Widget getAttribute(String info,IconData icon,Color color){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
        icon,
        size: 18.0,
        color: color,
      ),
      const SizedBox(
        width: 3.0,
      ),
      Text(
        info,
        style: const TextStyle(color: labelColor,fontSize: 13.0),
      )
    ],
  );
}
