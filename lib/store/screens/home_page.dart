import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../drawer.dart';
import '../../constant/colors.dart';
import '../../data.dart';
import '../widgets/feature_item.dart';
import '../course_details/screens/course_details.dart';
import './recommend_item.dart';

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
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          title: Image.asset(
            'assets/images/epent.png',
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black, size: 30.0),
        ),
        endDrawer: const DrawerAppBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: appBarColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset(
                          'assets/icons/shop.svg'
                        ),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: SvgPicture.asset(
                          'assets/icons/support.svg'
                      ),
                    )
                  ],
                ),
              ),
              const Center(
                child: Image(
                    image: AssetImage(
                        'assets/images/Background.png',
                    ),
                  height: 300.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 25.0,
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: TextStyle(
                      color: Color(0xff334155),
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit laboris nisi ut aliquip ex',
                  style: TextStyle(
                      color: Color(0xff7E7979),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: TextButton(
                      onPressed: (){},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff177FB0),),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)
                              )
                          )
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child:  Text(
                          'View All Courses',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF)
                          ),
                        ),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'most popular:',
                      style: TextStyle(
                        color: Color(0xffC94B04),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'Figma',
                      style: TextStyle(
                          color: Color(0xffC94B04),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'Flutter',
                      style: TextStyle(
                          color: Color(0xffC94B04),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'GO',
                      style: TextStyle(
                          color: Color(0xffC94B04),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffFFF7F2),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)
                  ),
                  color: const Color(0xffFFF7F2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Explore',
                        style: TextStyle(
                          color: Color(0xff3F3D56),
                          fontWeight: FontWeight.w600,
                          fontSize: 26.0
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Our',
                            style: TextStyle(
                                color: Color(0xff3F3D56),
                                fontWeight: FontWeight.w600,
                                fontSize: 26.0
                            ),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            'Popular',
                            style: TextStyle(
                                color: Color(0xffC94B04),
                                fontWeight: FontWeight.w600,
                                fontSize: 26.0
                            ),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            'Courses',
                            style: TextStyle(
                                color: Color(0xff3F3D56),
                                fontWeight: FontWeight.w600,
                                fontSize: 26.0
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        child: Divider(
                          thickness: 1.5,
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'view all category',
                            style: TextStyle(
                              color: Color(0xff7E7979),
                              fontSize: 14.0
                            ),
                          ),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Color(0xffC94B04),
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
                              color: const Color(0xff7E7979),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xffE6E6E6),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Color(0xffFFFFFF),
                                width: 70.0,
                                height: 70.0,
                                child: const Image(
                                    image: AssetImage(
                                      'assets/images/g2869.png'
                                    ),
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Business',
                                    style: TextStyle(
                                      color: Color(0xff3F3D56),
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
                                        color: Color(0xff3F3D56),
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
                              color: const Color(0xff7E7979),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xffE6E6E6),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: const Color(0xffFFFFFF),
                                width: 70.0,
                                height: 70.0,
                                child: const Image(
                                  image: AssetImage(
                                      'assets/images/Icon_27.png'
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'IT',
                                    style: TextStyle(
                                        color: Color(0xff3F3D56),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '150 Courses',
                                    style: TextStyle(
                                        color: Color(0xff3F3D56),
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
                              color: const Color(0xff7E7979),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xffE6E6E6),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: const Color(0xffFFFFFF),
                                width: 70.0,
                                height: 70.0,
                                child: const Image(
                                  image: AssetImage(
                                      'assets/images/Vector.png'
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Development',
                                    style: TextStyle(
                                        color: Color(0xff3F3D56),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '80 Courses',
                                    style: TextStyle(
                                        color: Color(0xff3F3D56),
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
                color: Color(0xffD7E8F1),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Discover',
                        style: TextStyle(
                          color: Color(0xff3F3D56),
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'World\' Best',
                            style: TextStyle(
                                color: Color(0xff3F3D56),
                                fontSize: 26.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Courses',
                            style: TextStyle(
                                color: Color(0xffC94B04),
                                fontSize: 26.0,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                    ],
                  ),
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
                    SizedBox(
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