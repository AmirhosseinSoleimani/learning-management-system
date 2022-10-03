import 'package:flutter/material.dart';
import 'package:learning_management_system/introScreen.dart';
import 'package:learning_management_system/store/screens/home_page.dart';
import './authentication/home_page_authentication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const IntroScreen(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        HomePageAuthentication.routeName: (context) => const HomePageAuthentication(),
      },
    );
  }
}

