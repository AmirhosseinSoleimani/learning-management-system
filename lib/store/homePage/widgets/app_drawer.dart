import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_in/sign_in.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import 'package:learning_management_system/student/screens/home_page.dart';
import 'package:learning_management_system/teacher/quiz_marker/screens/quiz_marker.dart';
import '../../../student/screens/calendar_table.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Sign in/Sign up'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(Routes.studentSignUp);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Quiz Marker'),
            onTap: (){
              Navigator.pushNamed(context, QuizMarker.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(Routes.teacherDashboard);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_outlined),
            title: const Text('Calendar'),
            onTap: (){
              Navigator.pushNamed(context, CalendarTable.routeName);
            },
          )
        ],
      ),
    );
  }
}
