import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/store/course_details/widgets/discover_courses.dart';
import '../../../authentication/sign_up/teacher/teacher_sign_up.dart';
import '../../../presentation/footer/footer.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../widgets/header_homePage.dart';
import '../../drawer.dart';
import '../../../data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/feature_item.dart';
import '../../course_details/screens/course_details.dart';
import '../widgets/new_blog.dart';
import '../widgets/our_teachers.dart';
import '../widgets/teacher_section.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/store';
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          title: Image.asset(
            'assets/images/epent.png',
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: ColorManager.black,
              size: 30.0,
          ),
        ),
        endDrawer: const DrawerAppBar(),
        drawer: const AppDrawer(),
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorManager.lightBlue1,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderHomePage(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: ColorManager.navajoWhite,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)
                  ),
                  color: ColorManager.navajoWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: ColorManager.slateGray2,
                          fontWeight: FontWeight.w600,
                          fontSize: 26.0
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Our',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontWeight: FontWeight.w600,
                                fontSize: 26.0
                            ),
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          Column(
                            children: [
                              Text(
                                'Popular',
                                style: TextStyle(
                                    color: ColorManager.darkOrange,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 26.0
                                ),
                              ),
                              const Image(
                                image: AssetImage(
                                    ImageAssets.markLine
                              ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            'Courses',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontWeight: FontWeight.w600,
                                fontSize: 26.0
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        child: Divider(
                          thickness: 1.5,
                          color: ColorManager.lightSteelBlue1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'view all category',
                            style: TextStyle(
                              color: ColorManager.lightSteelBlue1,
                              fontSize: 14.0
                            ),
                          ),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.arrow_forward,
                                color: ColorManager.darkOrange,
                                size: 20.0,
                              ),
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: ColorManager.oldLaceOpacity50,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            color: ColorManager.oldLaceOpacity50,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: ColorManager.white,
                                width: 70.0,
                                height: 70.0,
                                child: const Image(
                                    image: AssetImage(
                                        ImageAssets.marketingLogo
                                    ),
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Business',
                                    style: TextStyle(
                                      color: ColorManager.slateGray2,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '62 Courses',
                                    style: TextStyle(
                                        color: ColorManager.slateGray2,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: ColorManager.oldLaceOpacity50,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            color: ColorManager.oldLaceOpacity50,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: ColorManager.white,
                                width: 70.0,
                                height: 70.0,
                                child: const Image(
                                  image: AssetImage(
                                      ImageAssets.iTLogo
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'IT',
                                    style: TextStyle(
                                        color: ColorManager.slateGray2,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '150 Courses',
                                    style: TextStyle(
                                        color: ColorManager.slateGray2,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: ColorManager.oldLaceOpacity50,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            color: ColorManager.oldLaceOpacity50,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: ColorManager.white,
                                width: 70.0,
                                height: 70.0,
                                child: const Image(
                                  image: AssetImage(
                                      ImageAssets.softwareLogo
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Development',
                                    style: TextStyle(
                                        color: ColorManager.slateGray2,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '80 Courses',
                                    style: TextStyle(
                                        color: ColorManager.slateGray2,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: ColorManager.lightBlue1,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  color: ColorManager.lightBlue1,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(
                          color: ColorManager.slateGray2,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'World\' Best',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 26.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Column(
                            children: [
                              Text(
                                'Courses',
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
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: DiscoverCourses(
                          data: {"courses": features[1]},
                        ),
                      ),
                      SizedBox(
                        child: Divider(
                          thickness: 1.5,
                          color: ColorManager.lightSteelBlue1,
                        ),
                      ),
                      getFeatures(context: context),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.71,
                child: Stack(
                  children: [
                    const Image(image: AssetImage(
                        ImageAssets.homePageBody1
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'why students',
                                style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'choose',
                                    style: TextStyle(
                                        color: ColorManager.darkOrange,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        ImageAssets.markLine
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(
                            'us for gain their knowledge',
                            style: TextStyle(
                                color: ColorManager.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 100.0,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'There are always new freebies',
                            style: TextStyle(
                              fontSize: 17,
                              color: ColorManager.lightSteelBlue1,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'for you to enjoy on Envato',
                            style: TextStyle(
                                fontSize: 17,
                                color: ColorManager.lightSteelBlue1,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Website templates here on ',
                            style: TextStyle(
                                fontSize: 17,
                                color: ColorManager.lightSteelBlue1,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'ThemeForest WordPress plugins,',
                            style: TextStyle(
                                fontSize: 17,
                                color: ColorManager.lightSteelBlue1,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'assets of all sorts.',
                            style: TextStyle(
                                fontSize: 17,
                                color: ColorManager.lightSteelBlue1,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 280,
                      left: 30.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: ColorManager.lightSteelBlue1,
                                  child: Icon(
                                    Icons.done,
                                    color: ColorManager.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'Website templates here',
                                style: TextStyle(
                                  color: ColorManager.lightSteelBlue1,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: ColorManager.lightSteelBlue1,
                                  child: Icon(
                                    Icons.done,
                                    color: ColorManager.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'always new freebies',
                                style: TextStyle(
                                    color: ColorManager.lightSteelBlue1,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: ColorManager.lightSteelBlue1,
                                  child: Icon(
                                    Icons.done,
                                    color: ColorManager.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'enjoy on Envato Market',
                                style: TextStyle(
                                    color: ColorManager.lightSteelBlue1,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const OurTeachers(),
              const TeacherSection(),
              const NewBlog(),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
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