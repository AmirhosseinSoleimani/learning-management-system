import 'package:flutter/material.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';

class StudentRead extends StatelessWidget {
  const StudentRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.71,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Image(image: AssetImage(
                ImageAssets.homePageBody1
            ),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 20.0,
            top: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'why students',
                      style: TextStyle(
                          color: ColorManager.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'choose',
                          style: TextStyle(
                              color: ColorManager.darkOrange,
                              fontSize: 26,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        const Image(
                          image: AssetImage(
                              ImageAssets.markLine
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  'us for gain their knowledge',
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'There are always new freebies',
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorManager.lightSteelBlue1,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'for you to enjoy on Envato',
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorManager.lightSteelBlue1,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Website templates here on ',
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorManager.lightSteelBlue1,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ThemeForest WordPress plugins,',
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorManager.lightSteelBlue1,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'assets of all sorts.',
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorManager.lightSteelBlue1,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 280,
            left: 30.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.lightSteelBlue1,
                        child: Icon(
                          Icons.done,
                          color: ColorManager.white,
                          size: 25.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Website templates here',
                      style: TextStyle(
                          color: ColorManager.lightSteelBlue1,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.lightSteelBlue1,
                        child: Icon(
                          Icons.done,
                          color: ColorManager.white,
                          size: 25.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'always new freebies',
                      style: TextStyle(
                          color: ColorManager.lightSteelBlue1,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.lightSteelBlue1,
                        child: Icon(
                          Icons.done,
                          color: ColorManager.white,
                          size: 25.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'enjoy on Envato Market',
                      style: TextStyle(
                          color: ColorManager.lightSteelBlue1,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
