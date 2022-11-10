import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../../widgets/widgets.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.primary,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.61,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8.0
              ),
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          getButton(
                              text: 'About us',
                              context: context,
                              color: ColorManager.white,
                              height: MediaQuery.of(context).size.height * 0.4/ 6,
                              width: MediaQuery.of(context).size.width * 0.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              borderColor: ColorManager.primary
                          ),
                          getButton(
                              text: 'Contact us',
                              context: context,
                              color: ColorManager.white,
                              height: MediaQuery.of(context).size.height * 0.4/ 6,
                              width: MediaQuery.of(context).size.width * 0.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              borderColor: ColorManager.primary
                          ),
                          getButton(
                              text: 'Blog',
                              context: context,
                              color: ColorManager.white,
                              height: MediaQuery.of(context).size.height * 0.4/ 6,
                              width: MediaQuery.of(context).size.width * 0.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              borderColor: ColorManager.primary
                          ),
                          getButton(
                              text: 'Support',
                              context: context,
                              color: ColorManager.white,
                              height: MediaQuery.of(context).size.height * 0.4/ 6,
                              width: MediaQuery.of(context).size.width * 0.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              borderColor: ColorManager.primary
                          ),
                          getButton(
                              text: 'become teacher',
                              context: context,
                              color: ColorManager.white,
                              height: MediaQuery.of(context).size.height * 0.4/ 6,
                              width: MediaQuery.of(context).size.width * 0.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              borderColor: ColorManager.primary
                          ),
                          getButton(
                              text:' news',
                              context: context,
                              color: ColorManager.white,
                              height: MediaQuery.of(context).size.height * 0.4/ 6,
                              width: MediaQuery.of(context).size.width * 0.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              borderColor: ColorManager.primary
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
                                text: 'cookies',
                                context: context,
                                color: ColorManager.white,
                                height: MediaQuery.of(context).size.height * 0.4/ 6,
                                width: MediaQuery.of(context).size.width * 0.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                borderColor: ColorManager.primary
                            ),
                            getButton(
                                text: 'privacy',
                                context: context,
                                color: ColorManager.white,
                                height: MediaQuery.of(context).size.height * 0.4/ 6,
                                width: MediaQuery.of(context).size.width * 0.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                borderColor: ColorManager.primary
                            ),
                            getButton(
                                text: 'terms of',
                                context: context,
                                color: ColorManager.white,
                                height: MediaQuery.of(context).size.height * 0.4/ 6,
                                width: MediaQuery.of(context).size.width * 0.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                borderColor: ColorManager.primary
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getIconButton(
                      IconAssets.instagram, ColorManager.lavender, 20, 20
                  ),
                  getIconButton(
                      IconAssets.telegram, ColorManager.lavender, 20, 20
                  ),
                  getIconButton(
                      IconAssets.whatsApp, ColorManager.lavender, 20, 20
                  ),
                  getIconButton(
                      IconAssets.twitter, ColorManager.lavender, 20, 20
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
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.left,
              ),
            )
          ],
        )
    );
  }
}