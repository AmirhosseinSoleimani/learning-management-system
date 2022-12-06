import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';

import '../../presentation/resources/routes_manager.dart';
// import '../chat/chat.dart';
// import '../chat/model/ChatModel.dart';
// import '../chat/screens/Homescreen.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();

}
String dropDownValue = 'English';
var items = ['English', 'فارسی'];

class _EndDrawerState extends State<EndDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text('Dashboard',style: TextStyle(color: ColorManager.primary),),
              leading: SvgPicture.asset(
                IconAssets.dashboard
              ),
              onTap: (){
                Navigator.of(context).pushReplacementNamed(Routes.teacherDashboard);
              },
            ),
            ExpansionTile(
              title: const Text('Courses'),
              leading: SvgPicture.asset(
                  IconAssets.course
              ),
              children: [
                ListTile(
                  title: const Text('Create Course'),
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed(Routes.addCourseLayout);
                  },
                ),
                ListTile(
                  title: const Text('Courses'),
                  onTap: (){
                    // Navigator.of(context).pushReplacementNamed(Routes.a);
                  },
                ),
              ],
            ),

            ListTile(
              title: const Text('Certificate'),
              leading: SvgPicture.asset(
                  IconAssets.certificate
              ),
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()
                // );

              },
            ),
            ListTile(
              title: const Text('Calendar'),
              leading: SvgPicture.asset(
                  IconAssets.calendarDashboard
              ),
              onTap: (){},
            ),
            ListTile(
              title: const Text('Certificate'),
              leading: SvgPicture.asset(
                  IconAssets.certificate
              ),
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()
                // );

              },
            ),
            ListTile(
              title: const Text('Calendar'),
              leading: SvgPicture.asset(
                  IconAssets.calendarDashboard
              ),
              onTap: (){},
            ),
            ListTile(
              title: const Text('Feeds'),
              leading: SvgPicture.asset(
                  IconAssets.feeds
              ),
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()
                // );

              },
            ),
            ListTile(
              title: const Text('Helps'),
              leading: SvgPicture.asset(
                  IconAssets.helps
              ),
              onTap: (){},
            ),
            ListTile(
              title: const Text('Tickets'),
              leading: SvgPicture.asset(
                  IconAssets.tickets
              ),
              onTap: (){},
            ),
            ListTile(
              title: const Text('Setting'),
              leading: SvgPicture.asset(
                  IconAssets.setting
              ),
              onTap: (){},
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0))),
                  value: dropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
