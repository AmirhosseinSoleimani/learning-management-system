import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../widgets/widgets.dart';

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
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.shadowColorOpacity10,
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
                      borderRadius: BorderRadius.circular(5.0),
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
                    color: ColorManager.white
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                  color: ColorManager.white
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
                              color: ColorManager.paleTurquoise,
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)
                          ),
                          color: ColorManager.paleTurquoise,
                      ),
                      child: Center(
                        child: Text(
                          'Business',
                          style: TextStyle(
                            color: ColorManager.slateGray2,
                            fontSize: 14.0
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'fashion photography from professional',
                        style: TextStyle(
                          color: ColorManager.slateGray2,
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
                          getAttribute(data["review"],Icons.star,ColorManager.gold,ColorManager.lightSteelBlue1,12),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '(3.8k + Review)',
                            style: TextStyle(
                              color: ColorManager.lightSteelBlue1,
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
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          getAttribute(data["session"],Icons.bookmark_border_outlined,ColorManager.lightSteelBlue1,ColorManager.lightSteelBlue1,12),
                          const SizedBox(
                            width: 5.0,
                          ),
                          getAttribute(data["duration"],Icons.schedule_outlined,ColorManager.lightSteelBlue1,ColorManager.lightSteelBlue1,12),
                          const SizedBox(
                            width: 8.0,
                          ),
                          TextButton(
                              onPressed: (){},
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                              backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primary),
                            ),
                              child: Text(
                                'participate',
                                style: TextStyle(
                                  color: ColorManager.white
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

