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
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffFFFFFF)
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xffFFFFFF)
                ),
                child: Image.asset(
                        'assets/images/image 7.png',
                  fit: BoxFit.fill,
                ),
                ),
            ),
            Positioned(
              top: 210.0,
              child: SizedBox(
                width: 270.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color(0xffAED2E3),
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)
                          ),
                          color: const Color(0xffAED2E3),
                      ),
                      child: const Center(
                        child: Text(
                          'Business',
                          style: TextStyle(
                            color: Color(0xff3F3D56),
                            fontSize: 14.0
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'fashion photography from professional',
                        style: TextStyle(
                          color: Color(0xff3F3D56),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          getAttribute(data["review"],Icons.star,const Color(0xffFAD564),),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            '(3.8k + Review)',
                            style: TextStyle(
                              color: Color(0xff7E7979),
                              fontSize: 14
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          getAttribute(data["session"],Icons.bookmark_border_outlined,const Color(0xff7E7979),),
                          const SizedBox(
                            width: 3.0,
                          ),
                          getAttribute(data["duration"],Icons.schedule_outlined,const Color(0xff7E7979),),
                          const SizedBox(
                            width: 3.0,
                          ),
                          TextButton(
                              onPressed: (){},
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff187EB3)),
                            ),
                              child: const Text(
                                'participate',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF)
                                ),
                              ),
                          )
                        ],
                      ),
                    ),
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
        size: 24.0,
        color: color,
      ),
      const SizedBox(
        width: 3.0,
      ),
      Text(
        info,
        style: const TextStyle(color: Color(0xff7E7979),fontSize: 12.0),
      )
    ],
  );
}