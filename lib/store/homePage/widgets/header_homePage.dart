import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management_system/models/store_model.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:learning_management_system/provider/store_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: ColorManager.navajoWhite,
              child: const Image(
                image: AssetImage(
                  ImageAssets.homePageHeader,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed(Routes.shopPageRoute);
                  },
                  icon: SvgPicture.asset(
                      IconAssets.shop
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: SvgPicture.asset(
                      IconAssets.support
                  ),
                )
              ],
            ),
          ),
          (Provider.of<StoreProvider>(context).storePayment.isEmpty) ? Container(
            child: null,
          ) : Positioned(
            top: 8.0,
            left: 38.0,
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: ColorManager.white
                ),
                borderRadius: BorderRadius.circular(100.0),
                color: ColorManager.white
              ),
              child: Center(
                  child: Text(
                      '${Provider.of<StoreProvider>(context).storePayment.length}',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.primary
                    ),
                  ),
              ),
            ),
          ),
          Positioned(
            bottom: 250.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Text(
                'Lorem ipsum dolor sit amet',
                style: TextStyle(
                    color: ColorManager.slateGray1,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            bottom: 180.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit laboris nisi ut aliquip ex',
                  style: TextStyle(
                      color: ColorManager.lightSteelBlue1,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100.0,
            left: 35.0,
            child: Center(
              child: TextButton(
                  onPressed: (){},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ColorManager.primary,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)
                          )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child:  Text(
                      'View All Courses',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.white
                      ),
                    ),
                  )
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            left: 30.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'most popular:',
                    style: TextStyle(
                        color: ColorManager.darkOrange,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  Text(
                    'Figma',
                    style: TextStyle(
                        color: ColorManager.darkOrange,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  Text(
                    'Flutter',
                    style: TextStyle(
                        color: ColorManager.darkOrange,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  Text(
                    'GO',
                    style: TextStyle(
                        color: ColorManager.darkOrange,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
