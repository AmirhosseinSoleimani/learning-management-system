import 'package:flutter/material.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      color: ColorManager.lightBlue1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorManager.navajoWhite,
          ),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)
          ),
          color: ColorManager.navajoWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                    color: ColorManager.slateGray2,
                    fontWeight: FontWeight.w600,
                    fontSize: 26.0
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Our',
                    style: TextStyle(
                        color: ColorManager.slateGray2,
                        fontWeight: FontWeight.w600,
                        fontSize: 26.0
                    ),
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Column(
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                            color: ColorManager.darkOrange,
                            fontWeight: FontWeight.w600,
                            fontSize: 26.0
                        ),
                      ),
                      const Image(
                        image: AssetImage(
                            ImageAssets.markLine
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    'Courses',
                    style: TextStyle(
                        color: ColorManager.slateGray2,
                        fontWeight: FontWeight.w600,
                        fontSize: 26.0
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                child: Divider(
                  thickness: 1.5,
                  color: ColorManager.lightSteelBlue1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'view all category',
                    style: TextStyle(
                        color: ColorManager.lightSteelBlue1,
                        fontSize: 14.0
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: ColorManager.darkOrange,
                      size: 20.0,
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: ColorManager.oldLaceOpacity50,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                    color: ColorManager.oldLaceOpacity50,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: ColorManager.white,
                        width: 70.0,
                        height: 70.0,
                        child: const Image(
                          image: AssetImage(
                              ImageAssets.marketingLogo
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Business',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '62 Courses',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: ColorManager.oldLaceOpacity50,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                    color: ColorManager.oldLaceOpacity50,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: ColorManager.white,
                        width: 70.0,
                        height: 70.0,
                        child: const Image(
                          image: AssetImage(
                              ImageAssets.iTLogo
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'IT',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '150 Courses',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: ColorManager.oldLaceOpacity50,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                    color: ColorManager.oldLaceOpacity50,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: ColorManager.white,
                        width: 70.0,
                        height: 70.0,
                        child: const Image(
                          image: AssetImage(
                              ImageAssets.softwareLogo
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Development',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '80 Courses',
                            style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
