import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management_system/store/course_details/widgets/discover_courses.dart';
import '../../authentication/sign_up/teacher/teacher_sign_up.dart';
import '../../presentation/resources/color_manager.dart';
import '../drawer.dart';
import '../../data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/feature_item.dart';
import '../course_details/screens/course_details.dart';

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
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(
                            color: ColorManager.slateGray1,
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit laboris nisi ut aliquip ex',
                          style: TextStyle(
                              color: ColorManager.lightSteelBlue1,
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                ColorManager.primary,
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0)
                                  )
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child:  Text(
                              'View All Courses',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white
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
                        children: [
                          Text(
                            'most popular:',
                            style: TextStyle(
                                color: ColorManager.darkOrange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            'Figma',
                            style: TextStyle(
                                color: ColorManager.darkOrange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            'Flutter',
                            style: TextStyle(
                                color: ColorManager.darkOrange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            'GO',
                            style: TextStyle(
                                color: ColorManager.darkOrange,
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
                          Text(
                            'Popular',
                            style: TextStyle(
                                color: ColorManager.darkOrange,
                                fontWeight: FontWeight.w600,
                                fontSize: 26.0
                            ),
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
                                      'assets/images/g2869.png'
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
                                      'assets/images/Icon_27.png'
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
                                      'assets/images/Vector.png'
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
                                        'assets/images/down-mark-line 3.png'
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
              Container(
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
                                  color: ColorManager.lightSteelBlue2,
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
                                          color: ColorManager.ivory
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
                                  Text(
                                    'Alex Stanton',
                                    style: TextStyle(
                                      color:ColorManager.slateGray2,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    'master of education degree',
                                    style: TextStyle(
                                        color: ColorManager.lightSteelBlue1,
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
                                                color: ColorManager.lightSteelBlue1
                                              ),
                                              borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Icon(Icons.favorite_border,
                                            size: 20.0,
                                            color: ColorManager.lightSteelBlue1,
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
                                                    color: ColorManager.primary
                                                ),
                                                borderRadius: BorderRadius.circular(5.0),
                                              color: ColorManager.primary
                                            ),
                                            child: Icon(
                                              Icons.share_outlined,
                                              size: 20.0,
                                              color: ColorManager.white,
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
                color: ColorManager.lightSteelBlue2,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.95,
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
                            color: ColorManager.greenOpacity60,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: ColorManager.greenOpacity60,
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0
                              ),
                              child: Text(
                                'start from today',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0
                              ),
                              child: Text(
                                  'become an instructor and spread your knowledge',
                                style: TextStyle(
                                    color: ColorManager.slateGray2,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context,TeacherSignUp.routeName);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primary,),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0)
                                          )
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0
                                    ),
                                    child: Text(
                                      'View Details',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.white
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
                            color: ColorManager.primary,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: ColorManager.primary,
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/course33.png'
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0
                              ),
                              child: Text(
                                'start from today',
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 10.0
                              ),
                              child: Text(
                                'become an instructor and spread your knowledge',
                                style: TextStyle(
                                    color: ColorManager.slateGray2,
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
                                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.greenOpacity60,),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0)
                                          )
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0
                                    ),
                                    child: Text(
                                      'View Details',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.white
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
              Container(
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
                                    'assets/images/down-mark-line 3.png',
                                ),
                                width: 70.0,
                                height: 20,
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
              Container(
                color: ColorManager.primary,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.61,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 8.0
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
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
                                    'Support',
                                    context
                                  ),
                                  getButton(
                                    'become teacher',
                                    context
                                  ),
                                  getButton(
                                    'news',
                                    context
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  getButton(
                                      'cookies',
                                      context
                                  ),
                                  getButton(
                                      'privacy',
                                      context
                                  ),
                                  getButton(
                                      'terms of',
                                      context
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                    SizedBox(
                      child: Divider(
                        thickness: 1,
                        color: ColorManager.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0
                      ),
                      child: Text(
                        'copyright..',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500
                        ),
                        textAlign: TextAlign.left,
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


Widget getButton(String text,BuildContext context){
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.4/ 6,
    child: TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
      ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: ColorManager.white
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
      icon: SvgPicture.asset(
        svg,
        width: 20.0,
        height: 20.0,
        color: ColorManager.lavender,
      ),
  );
}