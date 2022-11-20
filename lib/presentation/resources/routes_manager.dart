import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_in/sign_in.dart';
import 'package:learning_management_system/authentication/sign_up/student/student_sign_up.dart';
import 'package:learning_management_system/authentication/sign_up/teacher/second_teacher_information.dart';
import 'package:learning_management_system/authentication/sign_up/teacher/teacher_sign_up.dart';
import 'package:learning_management_system/store/homePage/screens/home_page.dart';
import 'package:learning_management_system/store/shop_page/screens/payment_page.dart';
import 'package:learning_management_system/teacher/add_course/screens/layout.dart';
import '../../authentication/sign_up/student/favourite.dart';
import '../../authentication/sign_up/student/second_student_information.dart';
import '../../authentication/sign_up/student/student_information.dart';
import '../../authentication/sign_up/teacher/google_map.dart';
import '../../authentication/sign_up/teacher/teacher_favourite.dart';
import '../../authentication/sign_up/teacher/teacher_information.dart';
import '../../authentication/sign_up/teacher/third_teacher_information.dart';
import '../../presentation/resources/string_manager.dart';
import '../../store/course_details/screens/course_details.dart';
import '../../store/shop_page/screens/shop_page.dart';
import '../../teacher/add_course/screens/title.dart';
import '../../teacher/dashboard/screens/dashboard.dart';

class Routes{
  static const String shopPageRoute = '/shop';
  static const String homePage = '/homePage';
  static const String paymentPageRoute = '/paymentPage';
  static const String teacherSignUpRoutes = '/teacherSignUp';
  static const String teacherInformationRoutes = '/teacherInformation';
  static const String teacherInformationSecondRoutes = '/teacherSecondInformation';
  static const String googleMap = '/googleMap';
  static const String teacherInformationThirdRoutes = '/teacherThirdInformation';
  static const String teacherFavouriteRoutes = '/teacherFavourite';
  static const String courseDetails = '/courseDetails';
  static const String studentSignUp = '/studentSignUP';
  static const String studentInformation = '/studentInformation';
  static const String studentSecondInformation = '/studentSecondInformation';
  static const String signIn = '/signIn';
  static const String studentFavourite = '/studentFavourite';
  static const String teacherDashboard = '/teacherDashboard';
  static const String addCourseLayout = '/addCourseLayout';
  static const String addCourseTitle = '/addCourseTitle';
}



class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.shopPageRoute:
        return MaterialPageRoute(builder: (_) => const ShopPage());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.paymentPageRoute:
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      case Routes.teacherSignUpRoutes:
        return MaterialPageRoute(builder: (_) => const TeacherSignUp());
      case Routes.teacherInformationRoutes:
        return MaterialPageRoute(builder: (_) => const InformationTeacherSignUp());
      case Routes.teacherInformationSecondRoutes:
        return MaterialPageRoute(builder: (_) => const SecondInformationTeacher());
      case Routes.googleMap:
        return MaterialPageRoute(builder: (_) => const GoogleMapPage());
      case Routes.teacherInformationThirdRoutes:
        return MaterialPageRoute(builder: (_) => const ThirdInformationStudentSignUp());
      case Routes.teacherFavouriteRoutes:
        return MaterialPageRoute(builder: (_) => const FavouriteTeacher());
      case Routes.courseDetails:
        return MaterialPageRoute(builder: (_) => const CourseDetails());
      case Routes.studentSignUp:
        return MaterialPageRoute(builder: (_) => const StudentSignUp());
      case Routes.studentInformation:
        return MaterialPageRoute(builder: (_) => const InformationStudentSignUp());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case Routes.studentSecondInformation:
        return MaterialPageRoute(builder: (_) => const SecondInformationStudent());
      case Routes.studentFavourite:
        return MaterialPageRoute(builder: (_) => const FavouriteStudent());
      case Routes.teacherDashboard:
        return MaterialPageRoute(builder: (_) => const TeacherPanel());
      case Routes.addCourseLayout:
        return MaterialPageRoute(builder: (_) => const Layout());
      case Routes.addCourseTitle:
        return MaterialPageRoute(builder: (_) => const CourseTitle());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text(AppString.noRouteFound),
      ),
      body: const Center(
        child: Text(AppString.noRouteFound),
      ),
    ),
    );
  }
}