import 'package:flutter/material.dart';
import 'package:learning_management_system/provider/course_section.dart';
import 'package:learning_management_system/provider/sign_in_provider.dart';
import 'package:learning_management_system/provider/store_provider.dart';
import 'package:provider/provider.dart';
import '../presentation/resources/routes_manager.dart';
import '../provider/add_courses_provider.dart';
import '../provider/quiz_app_provider.dart';
import '../provider/student_provider.dart';
import '../provider/teacher_provider.dart';
import '../teacher/calendar/models/task_list.dart';


class MyApp extends StatefulWidget {// default constructor
  MyApp._internal(); //private name constructor
  int appState = 0;
  static MyApp instance = MyApp._internal(); // single instance --singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(create: (context) => QuizAppProvider(),
        ),
        ChangeNotifierProvider(create: (context) => TeacherProvider(),
        ),
        ChangeNotifierProvider(create: (context) => StoreProvider(),
        ),
        ChangeNotifierProvider(create: (context) => AddCourseProvider(),
        ),
        ChangeNotifierProvider(create: (context) => CourseSectionProvider(),
        ),
        ChangeNotifierProvider(create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(create: (context) => Tasks(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.homePage,

      ),
    );
  }
}
