import 'package:flutter/material.dart';
import 'package:learning_management_system/student/common/app_colors.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20.0),
          color: AppColor.bgSideMenu,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              DrawerListTile(
                title: 'Dashboard',
                icon: Icons.home,
                press: (){},
              ),
              DrawerListTile(
                title: 'My Course',
                icon: Icons.school,
                press: (){},
              ),
              DrawerListTile(
                title: 'Calendar',
                icon: Icons.calendar_month_outlined,
                press: (){},
              ),
              DrawerListTile(
                title: 'Setting',
                icon: Icons.settings,
                press: (){},
              ),
              DrawerListTile(
                title: 'Support',
                icon: Icons.support,
                press: (){},
              ),
              const Spacer(),
              Image.asset("assets/images/sidebar_image.png"),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;
  const DrawerListTile({Key? key,required this.title,required this.icon,required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black
        ),
      ),

    );
  }
}

