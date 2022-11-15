import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management_system/store/shop_page/widgets/course_shop.dart';
import '../../../data.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Image.asset(
          ImageAssets.epent,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.homePage);
          },
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorManager.black,
          size: 30.0,
        ),
      ),
      endDrawer: const DrawerAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.shopPageRoute);
                },
                icon: SvgPicture.asset(IconAssets.shop),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(IconAssets.support),
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5, color: ColorManager.lightSteelBlue2),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'your product list',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28.0,
                          color: ColorManager.primary),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) => CourseShop(
                        data: courses[1],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
