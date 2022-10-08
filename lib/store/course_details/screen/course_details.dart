import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms/user/features/course_detail/presentation/widgets/custom_bottom_bar.dart';
import 'package:lms/user/features/course_detail/presentation/widgets/lesson_item.dart';
import 'package:lms/user/features/explore/presentation/widgets/bookmark_box.dart';
import 'package:lms/user/features/home/data/data.dart';
import '../../../../../theme/color.dart';
import 'package:readmore/readmore.dart';


class CourseDetailPage extends StatefulWidget {
  CourseDetailPage({Key? key,this.data}) : super(key: key);
  final data;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin{
  late TabController tabController;
  late var courseData;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    courseData = widget.data["courses"];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: buildAppbar(),
      body: buildBody(),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }

  buildAppbar(){
    return AppBar(
      backgroundColor: appBgColor,
      title: const Center(
        child: Text(
          'Detail',
          style: TextStyle(
              color: textColor
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: textColor),
    );
  }

  Widget buildBody(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0,20.0,15.0,20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              child: CachedNetworkImage(
                imageBuilder: (context,imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover
                      )
                  ),
                ),
                imageUrl: courseData["image"],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            getInfo(),
            const SizedBox(
              height: 10.0,
            ),
            Divider(),
            const SizedBox(
              height: 20.0,
            ),
            getTabBar(),
            getTabBarPages()
          ],
        ),
      ),
    );
  }

  Widget getTabBar(){
    return Container(
      child: TabBar(
        indicatorColor: primary,
        controller: tabController,
        tabs: const [
          Tab(
            child: Text(
              'Lessons',
              style: TextStyle(
                  fontSize: 16.0,
                  color: textColor
              ),
            ),
          ),
          Tab(
            child: Text(
              'Excercises',
              style: TextStyle(
                  fontSize: 16.0,
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTabBarPages(){
    return Container(
      width: double.infinity,
      height: 200.0,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          getLessons(),
          Container(
            child: Text(
                'Exercises'
            ),
          ),
        ],
      ),
    );
  }

  Widget getLessons(){
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context,index) => LessonItem(data: lessons[index]),
    );
  }

  Widget getInfo(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                courseData["name"],
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: textColor
                ),
              ),
              BookMarkBox(
                  onBookMark: (){}
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              getAttribute(Icons.play_circle_outline,courseData['session'],labelColor),
              const SizedBox(
                width: 20.0,
              ),
              getAttribute(Icons.schedule_outlined,courseData['duration'],labelColor),
              const SizedBox(
                width: 20.0,
              ),
              getAttribute(Icons.star,courseData['review'],yellow),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Course',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: textColor
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ReadMoreText(
                courseData["description"],
                trimLines: 2,
                trimMode: TrimMode.Line,
                style: const TextStyle(
                    fontSize: 14.0,
                    color: labelColor
                ),
                trimCollapsedText: 'Show more',
                moreStyle: const TextStyle(
                    fontSize: 14.0,
                    color: primary
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

  Widget getAttribute(IconData icon,String info,Color color){
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
          style: const TextStyle(
              color: labelColor
          ),
        )

      ],
    );
  }
}
