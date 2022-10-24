import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../constant/colors.dart';
class FeatureItem extends StatelessWidget {
  const FeatureItem({Key? key,this.data,required this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 270.0,
        height: 290,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 5.0,top: 5.0),
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
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
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
            Positioned(
              top: 180.0,
              right: 15.0,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: primary,
                ),
                child: Text(data["price"],
                  style: const TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            Positioned(
              top: 210.0,
              child: Container(
                width: 270.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data["name"],
                      style: const TextStyle(
                          color: textColor,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        getAttribute(data["session"],Icons.play_circle_fill_rounded,labelColor),
                        const SizedBox(
                          width: 10.0,
                        ),
                        getAttribute(data["duration"],Icons.schedule_outlined,labelColor),
                        const SizedBox(
                          width: 10.0,
                        ),
                        getAttribute(data["review"],Icons.star,yellow),
                      ],
                    )
                  ],
                ),
              ),
            ),
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