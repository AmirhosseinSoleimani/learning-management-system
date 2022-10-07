import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/home_page_authentication.dart';
import 'package:learning_management_system/teacher/quiz_marker.dart';

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
              Navigator.pushNamed(context, HomePageAuthentication.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Quiz Marker'),
            onTap: (){
              Navigator.pushNamed(context, QuizMarker.routeName);
            },
          )
        ],
      ),
    );
  }
}
