import 'package:flutter/material.dart';
import 'package:learning_management_system/student/common/app_colors.dart';
import '../widgets/side_bar.dart';
import './dashboard.dart';

class HomePageStudent extends StatelessWidget {
  static const routeName = '/student-dashboard';
  const HomePageStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: const SideBar(),
      backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Dashboard(),
          ],
        ),
      ),
    );
  }
}
