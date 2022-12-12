import 'package:flutter/material.dart';

import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';

class AddBlog extends StatelessWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: AppSize.s20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.teacherDashboard);
          },
        ),
        title: Image.asset(
          ImageAssets.epent,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.black, size: AppSize.s30),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 60.0),
            Center(
                child: Text(
                    'How To Create An New Blog?',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.slateGray2
                  ),
                ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Image(
                image: AssetImage(ImageAssets.addCourseLayout)
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed(Routes.addBlogContent);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        ColorManager.primary,
                      ),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(50.0)))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Start',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorManager.white,
                          size: 30,
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
