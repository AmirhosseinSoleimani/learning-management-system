import 'package:flutter/material.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../drawer.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

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
            Navigator.of(context).pushReplacementNamed(Routes.shopPageRoute);
          },
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorManager.black,
          size: 30.0,
        ),
      ),
      endDrawer: const DrawerAppBar(),
    );
  }
}
