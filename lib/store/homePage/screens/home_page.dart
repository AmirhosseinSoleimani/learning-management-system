import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../presentation/footer/footer.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
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
          leading: IconButton(
            icon: const Icon(Icons.person),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(Routes.signIn);
            },
          ),
          title: Image.asset(
            ImageAssets.epent,
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
        // drawer: const AppDrawer(),
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderHomePage(),
              const Explore(),
              const SelectedMenu(),
              const StudentRead(),
              OurTeachers(),
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