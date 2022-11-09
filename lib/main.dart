import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning_management_system/authentication/sign_in/sign_in.dart';
import 'package:learning_management_system/authentication/sign_up/student/favourite.dart';
import 'package:learning_management_system/student/screens/calendar_table.dart';
import './authentication/sign_up/student/student_sign_up.dart';
import './authentication/sign_up/student/student_information.dart';
import './authentication/sign_up/student/second_student_information.dart';
import 'package:learning_management_system/authentication/sign_up/seller.dart';
import 'package:learning_management_system/authentication/sign_up/student_address.dart';
import 'package:learning_management_system/introScreen.dart';
import 'package:learning_management_system/provider/quiz_app_provider.dart';
import 'package:learning_management_system/store/screens/home_page.dart';
import 'package:learning_management_system/student/screens/home_page.dart';
import 'package:learning_management_system/student/screens/user_info_model.dart';
import 'package:learning_management_system/teacher/quiz_marker/screens/add_questions.dart';
import 'authentication/sign_up/teacher/second_techer_information.dart';
import 'authentication/sign_up/teacher/teacher_information.dart';
import 'authentication/sign_up/teacher/teacher_sign_up.dart';
import 'teacher/quiz_marker/screens/quiz_marker.dart';
import 'package:provider/provider.dart';
import './store/course_details/screens/lesson_item_page.dart';
import './provider/student_provider.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserInfoAdapter());
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
        ChangeNotifierProvider(create: (context) => QuizAppProvider(),
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
          SignIn.routeName: (context) => const SignIn(),
          StudentSignUp.routeName: (context) => const StudentSignUp(),
          InformationStudentSignUp.routeName: (context) => const InformationStudentSignUp(),
          SecondInformationStudent.routeName: (context) => const SecondInformationStudent(),
          FavouriteStudent.routeName: (context) => const FavouriteStudent(),
          TeacherSignUp.routeName: (context) => const TeacherSignUp(),
          InformationTeacherSignUp.routeName: (context) => const InformationTeacherSignUp(),
          SecondInformationTeacher.routeName: (context) => const SecondInformationTeacher(),
          SellerSignUp.routeName: (context) => const SellerSignUp(),
          QuizMarker.routeName: (context) => const QuizMarker(),
          StudentAddress.routeName: (context) => const StudentAddress(),
          LessonItemPage.routeName: (context) => const LessonItemPage(),
          HomePageStudent.routeName: (context) => const HomePageStudent(),
          AddQuestions.routeName: (context) => const AddQuestions(),
          CalendarTable.routeName: (context) => const CalendarTable(),
        },
      ),
    );
  }
}

