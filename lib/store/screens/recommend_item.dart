import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({Key? key,this.data,required this.onTap}) : super(key: key);
  final data;
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
              child: CachedNetworkImage(
                imageBuilder: (context,imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(image: imageProvider,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"],
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  data["price"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: textColor,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    getAttribute(data["session"],Icons.play_circle_outline,labelColor),
                    const SizedBox(
                      width: 10.0,
                    ),
                    getAttribute(data["duration"],Icons.schedule_outlined,labelColor),
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
