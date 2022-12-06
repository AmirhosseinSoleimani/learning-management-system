import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../models/teacher_panel_progressive.dart';
import '../../presentation/dashboard_styles_manager.dart';
import '../../presentation/dashboard_color_manager.dart';
import '../../presentation/dashboard_value_manager.dart';

class SecondCard extends StatelessWidget {
  const SecondCard({
    super.key,
    required this.course,
    required this.size,
    required this.progressColor,
  });

  final List<Course> course;
  final Size size;
  final List progressColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: AppSize.s4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.s18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Your Activity',
                style: getBoldStyle(
                    color: ColorManager.slateGray2, fontSize: AppSize.s18),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: ColorTeacherPanel.searchContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subject',style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          color: ColorManager.black
                        ),),
                        Text('Count',style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: ColorManager.black
                        ),)
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSize.s18, horizontal: AppSize.s18),
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                            child: Text(course[i].courseTitle,style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400
                            ),)),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                child: LinearPercentIndicator(
                                  progressColor: progressColor[i],
                                  barRadius: const Radius.circular(5),
                                  percent: course[i].coursePercent / 100,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(course[i].duration.toString()),
                            ))
                      ],
                    ),
                  ),
                  itemCount: course.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
