import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_up/seller.dart';
import 'package:learning_management_system/authentication/sign_up/student.dart';
import 'package:learning_management_system/authentication/sign_up/student_address.dart';
import 'package:learning_management_system/authentication/sign_up/teacher.dart';
import 'package:learning_management_system/introScreen.dart';
import 'package:learning_management_system/store/screens/home_page.dart';
import 'package:learning_management_system/student/screens/home_page.dart';
import './teacher/quiz_marker.dart';
import 'package:learning_management_system/teacher/quiz_marker.dart';
import 'package:provider/provider.dart';
import './authentication/home_page_authentication.dart';
import './store/course_details/screens/lesson_item_page.dart';
import './provider/student_provider.dart';
import './provider/teacher_provider.dart';
import './provider/seller_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider(),
        ),

      ],
      child: MaterialApp(
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
          StudentSignUp.routeName: (context) => const StudentSignUp(),
          TeacherSignUp.routeName: (context) => const TeacherSignUp(),
          SellerSignUp.routeName: (context) => const SellerSignUp(),
          QuizMarker.routeName: (context) => const QuizMarker(),
          StudentAddress.routeName: (context) => const StudentAddress(),
          LessonItemPage.routeName: (context) => const LessonItemPage(),
          HomePageStudent.routeName: (context) => const HomePageStudent(),
        },
      ),
    );
  }
}

