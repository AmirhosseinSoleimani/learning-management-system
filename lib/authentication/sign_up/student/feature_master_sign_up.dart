import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../constant/colors.dart';

class FeatureMasterSignUp extends StatelessWidget {
  const FeatureMasterSignUp({Key? key, this.data, required this.onTap})
      : super(key: key);
  final data;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 1))
                    ],
                  ),
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image:
                              DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                    ),
                    imageUrl: data["image"],
                  ),
                ),
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        SizedBox(
          width: 140,
          height: 195,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xffD9D9D9),
                  boxShadow: [
                    BoxShadow(
                        color: shadowColor.withOpacity(.1),
                        spreadRadius: 5,
                        blurRadius: 0.5,
                        offset: const Offset(1, 1))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.school,
                            size: 28.0,
                            color: Color(0xff177FB0),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'MASTER',
                                style: TextStyle(
                                  color: Color(0xff3F3D56),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'JAMSHIDI',
                                style: TextStyle(
                                    color: Color(0xff3F3D56),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Lorem Ipsum is simply dummy text of the printing.',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff7E7979),
                          fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          getAttribute(data["review"],Icons.star,const Color(0xffFAD564),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget getAttribute(String info, IconData icon, Color color) {
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
        style: const TextStyle(color: Color(0xff3F3D56), fontSize: 13.0),
      )
    ],
  );
}
