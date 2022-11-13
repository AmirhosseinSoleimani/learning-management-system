import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Positioned.fill(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xffFFF7F2),
                child: const Image(
                  image: AssetImage(
                    ImageAssets.homePageHeader,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Row(
              children: [
                IconButton(
                  onPressed: (){},
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
          Positioned(
            top: 420.0,
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
            bottom: 200.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
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
