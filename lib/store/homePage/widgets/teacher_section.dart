import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';

class TeacherSection extends StatelessWidget {
  const TeacherSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightBlue2,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.95,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.42,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: ColorManager.greenOpacity60,
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.greenOpacity60,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage(
                            ImageAssets.homePageBody2
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0
                    ),
                    child: Text(
                      'start from today',
                      style: TextStyle(
                          color: ColorManager.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0
                    ),
                    child: Text(
                      'become an instructor and spread your knowledge',
                      style: TextStyle(
                          color: ColorManager.slateGray2,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacementNamed(Routes.teacherSignUpRoutes);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primary,),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0
                          ),
                          child: Text(
                            'View Details',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.white
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.42,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: ColorManager.primary,
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.primary,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage(
                            ImageAssets.homePageBody3
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0
                    ),
                    child: Text(
                      'start from today',
                      style: TextStyle(
                          color: ColorManager.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0
                    ),
                    child: Text(
                      'become an instructor and spread your knowledge',
                      style: TextStyle(
                          color: ColorManager.slateGray2,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: (){},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(ColorManager.greenOpacity60,),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                )
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0
                          ),
                          child: Text(
                            'View Details',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.white
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
