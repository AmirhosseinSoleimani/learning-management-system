import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import '../resources/color_manager.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.primary,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.61,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8.0
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          getButton(
                              'About us',
                              context
                          ),
                          getButton(
                              'Contact us',
                              context
                          ),
                          getButton(
                              'Blog',
                              context
                          ),
                          getButton(
                              'Support',
                              context
                          ),
                          getButton(
                              'become teacher',
                              context
                          ),
                          getButton(
                              'news',
                              context
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            getButton(
                                'cookies',
                                context
                            ),
                            getButton(
                                'privacy',
                                context
                            ),
                            getButton(
                                'terms of',
                                context
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getIconButton(
                      IconAssets.instagram
                  ),
                  getIconButton(
                      IconAssets.telegram
                  ),
                  getIconButton(
                      IconAssets.whatsApp
                  ),
                  getIconButton(
                      IconAssets.twitter
                  )
                ],
              ),
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
                color: ColorManager.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0
              ),
              child: Text(
                'copyright..',
                style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.left,
              ),
            )
          ],
        )
    );
  }

  Widget getButton(String text,BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4/ 6,
      child: TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  color: ColorManager.white
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getIconButton(String svg){
    return IconButton(
      onPressed: (){},
      icon: SvgPicture.asset(
        svg,
        width: 20.0,
        height: 20.0,
        color: ColorManager.lavender,
      ),
    );
  }
}
