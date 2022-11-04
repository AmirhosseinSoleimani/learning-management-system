import 'package:flutter/material.dart';
import '../../../constant/colors.dart';


class QuizItem extends StatelessWidget {
  const QuizItem({
    Key? key,
    required this.quizTitle,
    required this.quizImageUrl,
    required this.quizStartCalendar,
    required this.duration,
    required this.quizDescription,
  }) : super(key: key);
  final String quizImageUrl;
  final String quizTitle;
  final String quizDescription;
  final int quizStartCalendar;
  final DateTime duration;


  @override
  Widget build(BuildContext context) {
    var dataCalendar = DateTime.fromMillisecondsSinceEpoch(quizStartCalendar * 1000);
    return GestureDetector(
      onTap: (){},
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
            SizedBox(
              width: 80,
              height: 80,
              child: Image.network(
                quizImageUrl,
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
                  quizTitle,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  quizDescription
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    getAttribute(dataCalendar,Icons.calendar_today,labelColor),
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
                          '${duration.minute.toString().padLeft(2,'0')}:${duration.second.toString().padLeft(2,'0')}',
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
Widget getAttribute(DateTime date,IconData icon,Color color){
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
        '${date.year}/${date.month}/${date.day}',
        style: const TextStyle(color: labelColor,fontSize: 13.0),
      )
    ],
  );
}
