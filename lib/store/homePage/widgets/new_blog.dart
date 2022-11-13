import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../data.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../course_details/screens/course_details.dart';
import 'feature_item.dart';

class NewBlog extends StatelessWidget {
  const NewBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      color: ColorManager.primary,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: ColorManager.lightBlue3
          ),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0)
          ),
          color: ColorManager.lightBlue3,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New ',
                    style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Blog',
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
                        width: 70.0,
                        height: 15,
                      ),
                    ],
                  )
                ],
              ),

            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              child: getFeatures(context: context),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFeatures({BuildContext? context}) {
    return CarouselSlider(
      items: List.generate(
        features.length,
            (index) => FeatureItem(
          data: features[index],
          onTap: () {
            Navigator.of(context!).push(MaterialPageRoute(builder: (context) => const CourseDetails(),
            ),
            );
          },
        ),
      ),
      options: CarouselOptions(
          height: 380.0, enlargeCenterPage: true, disableCenter: true),
    );
  }
}
