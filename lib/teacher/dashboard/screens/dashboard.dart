import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../presentation/footer/footer.dart';
import '../../../provider/sign_in_provider.dart';
import '../../presentation/dashboard_color_manager.dart';
import '../../presentation/dashboard_styles_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../presentation/dashboard_value_manager.dart';
import '../../models/teacher_panel_progressive.dart';
import '../end_drawer.dart';
import '../widgets/my_course.dart';
import '../widgets/teacher_drawer.dart';
import '../widgets/card_2.dart';

class TeacherPanel extends StatefulWidget {
  const TeacherPanel({Key? key}) : super(key: key);

  @override
  State<TeacherPanel> createState() => _TeacherPanelState();
}

class _TeacherPanelState extends State<TeacherPanel> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isClicked = false;
  final List<Course> course = [
    Course(
      coursePercent: 30,
      courseTitle: 'Courses Sold',
      duration: 13,
    ),
    Course(
      coursePercent: 25,
      courseTitle: 'Your Meetings',
      duration: 5,
    ),
    Course(
      coursePercent: 50,
      courseTitle: 'Uploaded Courses',
      duration: 25,
    ),
    Course(
      coursePercent: 80,
      courseTitle: 'Draft Courses',
      duration: 2,
    ),
  ];

  final List items = [
    'Design',
    'Code',
    'Manage',
    'Thinking',
  ];
  final List progressColor = const [
    Color(0xff177FB0),
    Color(0xffC94B04),
    Color(0xffFBBC05),
    Color(0xff5DBF23),
    Color(0xff177FB0),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const TeacherDrawer(),
      endDrawer: const EndDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        leading: TextButton(
          onPressed: () => () => scaffoldKey.currentState?.openDrawer(),
          child: Builder(
            builder: (context) => Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                    'assets/avatar/av1.jpg',
                  width: 60,
                  height: 60,
                ),
                Positioned(
                    left: 25,
                    bottom: 0,
                    child: Container(
                        width: 10,
                        height: 10,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: ColorTeacherPanel.statusPerson,
                          border: Border.all(
                              width: AppSize.s1_5, color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ))),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: SizedBox(
          width: 58,
          height: 53,
          child: Image.asset(
            'assets/svg/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${Provider.of<SignInProvider>(context,listen: false).userInformation[0].firstName}' + ' ' +Provider.of<SignInProvider>(context,listen: false).userInformation[0].lastName,
                          style: getBoldStyle(
                              color: ColorManager.slateGray2,
                              fontSize: AppSize.s18)),
                      Text(
                        'AnywhereWorks - dashboard',
                        style: getRegularStyle(
                            color: ColorManager.lightSteelBlue1, fontSize: 16),
                      )
                    ],
                  ),
                  InkWell(
                    radius: 12,
                    customBorder: const CircleBorder(),
                    onTap: () {
                      print('tapped');
                    },
                    child: Container(
                      width: 55,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          border: Border.all(
                              color: ColorTeacherPanel.searchContainer,
                              width: AppSize.s1_5)),
                      child: const Icon(Icons.search),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
              child: SecondCard(
                  course: course, size: size, progressColor: progressColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
              child: Card(
                elevation: AppSize.s4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSize.s18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                        child: Text(
                          "Your courses",
                          style: getBoldStyle(
                              color: ColorTeacherPanel.darkGrey,
                              fontSize: AppSize.s18),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s12),
                        child: SizedBox(
                          width: double.infinity,
                          height: 360,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: MyCourse(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: MyCourse(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: MyCourse(),
                                ),
                              ]),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSize.s18, horizontal: AppSize.s18),
                  child: Column(
                    children: [
                      Text(
                        'Recommendation for you',
                        style: getBoldStyle(
                            color: ColorTeacherPanel.darkGrey,
                            fontSize: AppSize.s18),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              LastCard(size: size),
                              LastCard(size: size),
                              LastCard(size: size),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class LastCard extends StatelessWidget {
  const LastCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                print('Clicked');
              },
              child: Stack(children: [
                Container(
                  width: 125,
                  height: 185,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/avatar/course5.jpg'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(AppSize.s12)),
                ),
                Positioned(
                  top: 7,
                  left: 7,
                  child: Container(
                    width: 38,
                    height: 13,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(AppSize.s4)),
                    child: Center(
                      child: Text("Manage",
                          style: getRegularStyle(
                              color: Colors.black, fontSize: AppSize.s8)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 5,
                  child: Container(
                    width: 43,
                    height: 22,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(AppSize.s16)),
                    child: Center(
                      child: Text("15 min",
                          style: getRegularStyle(
                              color: Colors.white, fontSize: AppSize.s12)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: ColorTeacherPanel.boxColorGreen,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 15,
                        )),
                  ),
                ),
              ]),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              width: 130,
              child: Text(
                'Any mechanical keyboard enthusiasts',
                style: getBoldStyle(color: ColorTeacherPanel.darkGrey),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              width: 100,
              child: Stack(
                children: [
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                          width: 40,
                          child: ClipOval(
                              child: Image.asset(
                                'assets/avatar/av1.jpg',
                              ))),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                          width: 40,
                          child: ClipOval(
                              child: Image.asset(
                                'assets/avatar/av1.jpg',
                              ))),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                          width: 40,
                          child: ClipOval(
                              child: Image.asset(
                                'assets/avatar/av1.jpg',
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
