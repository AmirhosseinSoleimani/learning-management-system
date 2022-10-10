import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/colors.dart';
import '../widgets/app_drawer.dart';
import '../../data.dart';
import '../widgets/feature_item.dart';
import '../course_details/screens/course_details.dart';
import './recommend_item.dart';
import './get_categories.dart';

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
              const GetCategories(),
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
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
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
              getRecommend(),
              const SizedBox(
                height: 15.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                color: Colors.grey.shade500,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                getButton(
                                  'About us',
                                  context
                                ),
                                getButton(
                                  'Contact us',
                                  context
                                ),
                                getButton(
                                  'Blog',
                                  context
                                ),
                                getButton(
                                  'Get the app',
                                  context
                                ),
                                getButton(
                                  'Terms',
                                  context
                                ),
                                getButton(
                                  'Privacy Policy',
                                  context
                                ),

                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    width: 3.0,
                                    color: Colors.white,
                                  ),
                                  primary: Colors.grey.shade500
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.language_outlined,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'English',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          getIconButton(
                            'assets/images/telegram.svg'
                          ),
                          getIconButton(
                              'assets/images/facebook.svg'
                          ),
                          getIconButton(
                              'assets/images/instagram.svg'
                          ),
                          getIconButton(
                              'assets/images/twitter.svg'
                          )
                        ],
                      ),
                    )
                  ],
                )
              )
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

Widget getRecommend(){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children:
      List.generate(
          recommends.length, (index) => Container(
        padding: const EdgeInsets.only(left: 15.0),
        margin: const EdgeInsets.only(right: 15.0,bottom: 5.0),
        child: RecommendItem(
          data: recommends[index],
          onTap: (){
            print(index);
          },
        ),
      )
      ),
    ),
  );
}

Widget getButton(String text,BuildContext context){
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.3 / 6,
    child: TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
        primary: Colors.grey.shade500
      ),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white
              ),
            ),
          ],
        ),
    ),
  );
}

Widget getIconButton(String svg){
  return IconButton(
      onPressed: (){},
      icon: SvgPicture.asset(svg,
      width: 25.0,
        height: 25.0,
      ),
  );
}