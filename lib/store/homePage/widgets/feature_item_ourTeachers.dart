import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';
import '../../../presentation/resources/color_manager.dart';

class FeatureItemOurTeachers extends StatelessWidget {
  const FeatureItemOurTeachers({Key? key, this.data, required this.onTap})
      : super(key: key);

  final data;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 250,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(width: 2, color: ColorManager.lightSteelBlue2),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: ColorManager.shadowColorOpacity10,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: ColorManager.ivory),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    imageUrl: data['image'],
                  ),
                ),
              ),
              Text(
                'Alex Stanton',
                style: TextStyle(
                    color: ColorManager.slateGray2,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'master of education degree',
                style: TextStyle(
                    color: ColorManager.lightSteelBlue1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20.0,
                      color: ColorManager.darkOrange,
                    ),
                    Icon(
                      Icons.star,
                      size: 20.0,
                      color: ColorManager.darkOrange,
                    ),
                    Icon(
                      Icons.star,
                      size: 20.0,
                      color: ColorManager.darkOrange,
                    ),
                    Icon(
                      Icons.star,
                      size: 20.0,
                      color: ColorManager.darkOrange,
                    ),
                    Icon(
                      Icons.star,
                      size: 20.0,
                      color: ColorManager.darkOrange,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: ColorManager.lightSteelBlue1),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Icon(
                        Icons.favorite_border,
                        size: 20.0,
                        color: ColorManager.lightSteelBlue1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: ColorManager.primary),
                          borderRadius: BorderRadius.circular(5.0),
                          color: ColorManager.primary),
                      child: Icon(
                        Icons.share_outlined,
                        size: 20.0,
                        color: ColorManager.white,
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
