import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_up/student/student_sign_up.dart';
import 'package:learning_management_system/authentication/sign_up/teacher/second_teacher_information.dart';
import 'package:learning_management_system/authentication/sign_up/teacher/teacher_sign_up.dart';
import 'package:learning_management_system/store/homePage/screens/home_page.dart';
import 'package:learning_management_system/store/shop_page/screens/payment_page.dart';
import '../../authentication/sign_up/teacher/google_map.dart';
import '../../authentication/sign_up/teacher/teacher_favourite.dart';
import '../../authentication/sign_up/teacher/teacher_information.dart';
import '../../authentication/sign_up/teacher/third_teacher_information.dart';
import '../../presentation/resources/string_manager.dart';
import '../../store/course_details/screens/course_details.dart';
import '../../store/shop_page/screens/shop_page.dart';

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