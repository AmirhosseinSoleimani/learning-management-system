import 'package:flutter/material.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../course_details/widgets/discover_courses.dart';

class SelectedMenu extends StatelessWidget {
  const SelectedMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.85,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorManager.lightBlue1,
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
        color: ColorManager.lightBlue1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: TextStyle(
                  color: ColorManager.slateGray2,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'World\' Best',
                  style: TextStyle(
                      color: ColorManager.slateGray2,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Courses',
                      style: TextStyle(
                          color: ColorManager.darkOrange,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500
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
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.71,
              child: const DiscoverCourses(),
            ),
          ],
        ),
      ),
    );
  }
}