import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../data.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../course_details/screens/course_details.dart';
import 'feature_item_ourTeachers.dart';

class OurTeachers extends StatelessWidget {
  const OurTeachers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.68,
      color: ColorManager.lightBlue2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.68,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorManager.ivory,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          color: ColorManager.ivory,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'our ',
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Teachers',
                      style: TextStyle(
                          color: ColorManager.darkOrange,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const Image(
                      image: AssetImage(
                          ImageAssets.markLine
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 35.0
              ),
              child: Text(
                'Single user, personal educational use only, no redistribution. The total price includes the item price and a buyer fee.',
                style: TextStyle(
                    fontSize: 18,
                    color: ColorManager.lightSteelBlue1,
                    fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.42,
              child: getFeaturesOurTeachers(),
            )
          ],
        ),
      ),
    );
  }

  Widget getFeaturesOurTeachers({BuildContext? context}) {
    return CarouselSlider(
      items: List.generate(
        features.length,
            (index) => FeatureItemOurTeachers(
          data: features[index],
          onTap: () {
            Navigator.of(context!).push(
              MaterialPageRoute(
                builder: (context) => const CourseDetails(),
              ),
            );
          },
        ),
      ),
      options: CarouselOptions(
          height: 150.0, enlargeCenterPage: true, disableCenter: true, reverse: true),
    );
  }

}