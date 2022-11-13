import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/store/course_details/widgets/discover_courses.dart';
import '../../../authentication/sign_up/teacher/teacher_sign_up.dart';
import '../../../presentation/footer/footer.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../widgets/explore.dart';
import '../widgets/header_homePage.dart';
import '../../drawer.dart';
import '../../../data.dart';
import '../widgets/app_drawer.dart';
import '../widgets/feature_item.dart';
import '../../course_details/screens/course_details.dart';
import '../widgets/new_blog.dart';
import '../widgets/our_teachers.dart';
import '../widgets/selected_menu.dart';
import '../widgets/student_read.dart';
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
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HeaderHomePage(),
              Explore(),
              SelectedMenu(),
              StudentRead(),
              OurTeachers(),
              TeacherSection(),
              NewBlog(),
              Footer()
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