import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';

import '../../../presentation/resources/values_manager.dart';
import '../../presentation/dashboard_color_manager.dart';
import '../../presentation/dashboard_styles_manager.dart';
class MyCourse extends StatelessWidget {
  const MyCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: ColorManager.lightSteelBlue1,
        ),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/avatar/course5.jpg'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        'python level3 courses',
                        style: getBoldStyle(color: ColorManager.black,fontSize: 16.0),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Icon(Icons.schedule_outlined,color: ColorManager.lightSteelBlue1,),
                        Text('8h 12m',style: TextStyle(color: ColorManager.lightSteelBlue1),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    child: Stack(
                      children: [
                        Positioned(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SizedBox(
                                width: 35,
                                child: ClipOval(
                                    child: Image.asset(
                                      'assets/avatar/av1.jpg',
                                    ))),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SizedBox(
                                width: 35,
                                child: ClipOval(
                                    child: Image.asset(
                                      'assets/avatar/av1.jpg',
                                    ))),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SizedBox(
                                width: 35,
                                child: ClipOval(
                                    child: Image.asset(
                                      'assets/avatar/av1.jpg',
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Student:',style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                      '325',
                      style: TextStyle(fontSize: 16.0)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}