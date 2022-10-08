import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../widgets/app_drawer.dart';
import '../../data.dart';
import '../widgets/feature_item.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/store';
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _getAppBar(),
        drawer: const AppDrawer(),
        resizeToAvoidBottomInset: false,
        backgroundColor: appBarColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                child: Text(
                  'Featured',
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0),
                ),
              ),
              getFeatures(context: context),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Recommended',
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: labelColor,
                          fontSize: 14.0
                      ),
                    )
                  ],
                ),
              ),
              // getRecommend(),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar _getAppBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.blue,
    title: const Text(
      'LMS',
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
          Navigator.of(context!).push(MaterialPageRoute(builder: (context) => CourseDetailPage(data: {"courses": features[index]},),
          ),
          );
        },
      ),
    ),
    options: CarouselOptions(
        height: 290.0, enlargeCenterPage: true, disableCenter: true),
  );
}

// Widget getRecommend(){
//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       children:
//       List.generate(
//           recommends.length, (index) => Container(
//         padding: const EdgeInsets.only(left: 15.0),
//         margin: const EdgeInsets.only(right: 15.0,bottom: 5.0),
//         child: RecommendItem(
//           data: recommends[index],
//           onTap: (){
//             print(index);
//           },
//         ),
//       )
//       ),
//     ),
//   );
// }