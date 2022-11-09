import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management_system/store/course_details/widgets/discover_courses.dart';
import '../drawer.dart';
import '../../constant/colors.dart';
import '../../data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/feature_item.dart';
import '../course_details/screens/course_details.dart';
import './recommend_item.dart';

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
        drawer: const AppDrawer(),
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffD7E8F1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const Image(
                        image: AssetImage(
                            'assets/images/Group184.png',
                        ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 10.0,
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
                  Positioned(
                    top: 420.0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: const Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(
                            color: Color(0xff334155),
                            fontWeight: FontWeight.w600,
                            fontSize: 24.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200.0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit laboris nisi ut aliquip ex',
                          style: TextStyle(
                              color: Color(0xff7E7979),
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 35.0,
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
                  Positioned(
                    bottom: 60.0,
                    left: 30.0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
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
                  ),
                ],
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
                                color: const Color(0xffFFFFFF),
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
                                  SizedBox(
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffD7E8F1),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  color: const Color(0xffD7E8F1),
                ),
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
                        children: [
                          const Text(
                            'World\' Best',
                            style: TextStyle(
                                color: Color(0xff3F3D56),
                                fontSize: 26.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Column(
                            children: const [
                              Text(
                                'Courses',
                                style: TextStyle(
                                    color: Color(0xffC94B04),
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Image(
                                  image: AssetImage(
                                    'assets/images/down-mark-line 3.png'
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
                      const SizedBox(
                        child: Divider(
                          thickness: 1.5,
                          color: Color(0xff7E7979),
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
                      'assets/images/Group 192.png'
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
                              const Text(
                                'why students',
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Column(
                                children: const [
                                  Text(
                                    'choose',
                                    style: TextStyle(
                                        color: Color(0xffC94B04),
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/images/down-mark-line 3.png'
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Text(
                            'us for gain their knowledge',
                            style: TextStyle(
                                color: Color(0xff000000),
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
                        children: const [
                          Text(
                            'There are always new freebies',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xff7E7979),
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'for you to enjoy on Envato',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff7E7979),
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Website templates here on ',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff7E7979),
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'ThemeForest WordPress plugins,',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff7E7979),
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'assets of all sorts.',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff7E7979),
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
                            children: const [
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff7E7979),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'Website templates here',
                                style: TextStyle(
                                  color: Color(0xff7E7979),
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
                            children: const [
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff7E7979),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'always new freebies',
                                style: TextStyle(
                                    color: Color(0xff7E7979),
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
                            children: const [
                              SizedBox(
                                width: 25,
                                height: 35,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff7E7979),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'enjoy on Envato Market',
                                style: TextStyle(
                                    color: Color(0xff7E7979),
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.68,

                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffFFFCFC),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: const Color(0xffFFFCFC),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'our ',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 26.0,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              'Teachers',
                              style: TextStyle(
                                  color: Color(0xffC94B04),
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Image(
                              image: AssetImage(
                                  'assets/images/down-mark-line 3.png'
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 35.0
                      ),
                      child: Text(
                        'Single user, personal educational use only, no redistribution. The total price includes the item price and a buyer fee.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff7E7979),
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: features.length,
                        itemBuilder: (BuildContext context,int index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xffD9D9D9),
                                ),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xffFFFCFC)
                                        ),
                                        borderRadius: BorderRadius.circular(50.0)
                                      ),
                                      child: CachedNetworkImage(
                                        imageBuilder: (context,imageProvider) => Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50.0),
                                              image: DecorationImage(image: imageProvider,
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        imageUrl: features[index]['image'],
                                      ),

                                    ),
                                  ),
                                  const Text(
                                    'Alex Stanton',
                                    style: TextStyle(
                                      color: Color(0xff3F3D56),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  const Text(
                                    'master of education degree',
                                    style: TextStyle(
                                        color: Color(0xff7E7979),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 17.0,
                                      vertical: 8.0
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          size: 20.0,
                                          color: Color(0xffC94B04),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20.0,
                                          color: Color(0xffC94B04),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20.0,
                                          color: Color(0xffC94B04),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20.0,
                                          color: Color(0xffC94B04),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 20.0,
                                          color: Color(0xffC94B04),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: const Color(0xff7E7979)
                                              ),
                                              borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: const Icon(Icons.favorite_border,
                                            size: 20.0,
                                            color: Color(0xff7E7979),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: const Color(0xff177FB0)
                                                ),
                                                borderRadius: BorderRadius.circular(5.0),
                                              color: const Color(0xff177FB0)
                                            ),
                                            child: const Icon(
                                              Icons.share_outlined,
                                              size: 20.0,
                                              color: Color(0xffFFFFFF),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: const Color(0xffE8F2F7),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(

                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.42,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xff5DBF23).withOpacity(0.62),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xff5DBF23).withOpacity(0.62),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/Group180.png'
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0
                              ),
                              child: Text(
                                'start from today',
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0
                              ),
                              child: Text(
                                  'become an instructor and spread your knowledge',
                                style: TextStyle(
                                    color: Color(0xff3F3D56),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: (){},
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff177FB0),),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0)
                                          )
                                      )
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.0
                                    ),
                                    child: Text(
                                      'View Details',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFFFFFF)
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(

                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.42,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xff5DBF23).withOpacity(0.62),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xff5DBF23).withOpacity(0.62),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/Group180.png'
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0
                              ),
                              child: Text(
                                'start from today',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 10.0
                              ),
                              child: Text(
                                'become an instructor and spread your knowledge',
                                style: TextStyle(
                                    color: Color(0xff3F3D56),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: (){},
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff177FB0),),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0)
                                          )
                                      )
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0
                                    ),
                                    child: Text(
                                      'View Details',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFFFFFF)
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
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
                    SizedBox(
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
        height: 380.0, enlargeCenterPage: true, disableCenter: true),
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