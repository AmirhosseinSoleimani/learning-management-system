import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constant/colors.dart';
import '../../../data.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../homePage/./widgets/feature_item.dart';
import '../screens/course_details.dart';

class DiscoverCourses extends StatefulWidget {
  const DiscoverCourses({Key? key}) : super(key: key);

  @override
  State<DiscoverCourses> createState() => _DiscoverCoursesState();
}

class _DiscoverCoursesState extends State<DiscoverCourses>
    with SingleTickerProviderStateMixin {
  int _numWidget = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: buildBody()),
          SizedBox(
            child: Divider(
              thickness: 1.5,
              color: ColorManager.lightSteelBlue1,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: getFeaturesSelectedMenu(context: context),
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 50.0,
      childAspectRatio: 10 / 3,
      mainAxisSpacing: 1.0,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              _numWidget = 0;
            });
          },
          child: (_numWidget == 0)
              ? const Text(
                  "View All",
                  style: TextStyle(
                      color: Color(0xff3F3D56),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )
              : const Text(
                  "View All",
                  style: TextStyle(color: Color(0xff7E7979), fontSize: 20.0),
                ),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                _numWidget = 1;
              });
            },
            child: (_numWidget == 1)
                ? const Text(
                    "Data Science",
                    style: TextStyle(
                        color: Color(0xff3F3D56),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )
                : const Text(
                    "Data Science",
                    style: TextStyle(color: Color(0xff7E7979), fontSize: 20.0),
                  )),
        GestureDetector(
            onTap: () {
              setState(() {
                _numWidget = 2;
              });
            },
            child: (_numWidget == 2)
                ? const Text(
                    "Development",
                    style: TextStyle(
                        color: Color(0xff3F3D56),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )
                : const Text(
                    "Development",
                    style: TextStyle(color: Color(0xff7E7979), fontSize: 20.0),
                  )),
        GestureDetector(
          onTap: () {
            setState(() {
              _numWidget = 3;
            });
          },
          child: (_numWidget == 3)
              ? const Text(
                  "Business",
                  style: TextStyle(
                      color: Color(0xff3F3D56),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )
              : const Text(
                  "Business",
                  style: TextStyle(color: Color(0xff7E7979), fontSize: 20.0),
                ),
        ),
      ],
    );
  }

  Widget getAttribute(IconData icon, String info, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: color,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          info,
          style: const TextStyle(color: labelColor),
        )
      ],
    );
  }

  Widget getTextButton(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(title),
    );
  }

  Widget getFeaturesSelectedMenu({BuildContext? context}) {
    return CarouselSlider(
      items: List.generate(
        features.length,
        (index) => FeatureItem(
          data: (_numWidget == 1) ? features[1] : (_numWidget == 2) ? features[2] : (_numWidget == 3) ? features[3] : features[index],
          onTap: () {
            Navigator.of(context!).pushReplacementNamed(Routes.courseDetails);
          },
        ),
      ),
      options: CarouselOptions(
          height: 150.0, enlargeCenterPage: true, disableCenter: true, reverse: true),
    );
  }
}
