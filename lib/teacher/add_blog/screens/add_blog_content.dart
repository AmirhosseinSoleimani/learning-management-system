import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';

class AddBlogContent extends StatelessWidget {
  const AddBlogContent({Key? key}) : super(key: key);

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
            Navigator.of(context).pushReplacementNamed(Routes.addBlogLayout);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Course Title',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.slateGray2),
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 2,
                      color: ColorManager.lightSteelBlue2,
                    ),
                  ),
                  filled: true,
                  fillColor: ColorManager.lightSteelBlue3,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 2,
                        color: ColorManager.lightSteelBlue2),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'The Text Of The Article',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.slateGray2),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    primary: ColorManager.slateGray2,
                    backgroundColor: ColorManager.lightSteelBlue3,
                    side: BorderSide(color: ColorManager.lightSteelBlue2,width: 2.0)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(IconAssets.camera),
                      ),
                      Text(
                          'Add Photo',
                        style: TextStyle(
                          color: ColorManager.lightSteelBlue1,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 2,
                      color: ColorManager.lightSteelBlue2,
                    ),
                  ),
                  filled: true,
                  fillColor: ColorManager.lightSteelBlue3,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 2,
                        color: ColorManager.lightSteelBlue2),
                  ),
                ),
                maxLines: 10,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Short description of the course',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.slateGray2),
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 2,
                      color: ColorManager.lightSteelBlue2,
                    ),
                  ),
                  filled: true,
                  fillColor: ColorManager.lightSteelBlue3,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 2,
                        color: ColorManager.lightSteelBlue2),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Add Voice',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.slateGray2),
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
