import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../presentation/dashboard_styles_manager.dart';
import '../../presentation/dashboard_color_manager.dart';
import '../../presentation/dashboard_value_manager.dart';

class DetailUserCourse extends StatelessWidget {
  const DetailUserCourse({super.key, required this.size, required this.colore});

  final Size size;
  final Color colore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 290,
      decoration: BoxDecoration(
          color: colore, borderRadius: BorderRadius.circular(AppSize.s12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                      width: 40,
                      child: ClipOval(
                          child: Image.asset(
                            'assets/svg/avatar/av1.jpg',
                          ))),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(
                "Michal payne",
                style: getBoldStyle(fontSize: AppSize.s14, color: Colors.white),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svg/teacherPanel/bookmark.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
                SizedBox(
                  width: size.height * 0.01,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      color: const Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(AppSize.s80)),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: ColorTeacherPanel.boxColorGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
