import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_up/teacher/teacher_sign_up.dart';
import 'package:learning_management_system/store/homePage/screens/home_page.dart';
import 'package:learning_management_system/store/shop_page/screens/payment_page.dart';
import '../../presentation/resources/string_manager.dart';
import '../../store/shop_page/screens/shop_page.dart';

class Routes{
  static const String shopPageRoute = '/shop';
  static const String homePage = '/homePage';
  static const String paymentPageRoute = '/paymentPage';
  static const String teacherSignUpRoutes = '/teacherSignUp';
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