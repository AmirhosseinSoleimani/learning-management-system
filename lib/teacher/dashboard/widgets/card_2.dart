import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tetest/models/teacher_panel_corse_progressiv.dart';
import 'package:tetest/presentation/color_management.dart';
import 'package:tetest/presentation/styles_manager.dart';
import 'package:tetest/presentation/values_manager.dart';

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
          children: [
            Text(
              'Percentage of courses',
              style: getBoldStyle(
                  color: ColorTeacherPanel.darkGrey, fontSize: AppSize.s18),
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(children: const [
                    Text('Courses'),
                    SizedBox(
                      width: AppSize.s80,
                    ),
                    Text('Progress'),
                    Spacer(),
                    Text('Duration')
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
                  shrinkWrap: true,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(course[i].courseTitle),
                      ),
                      SizedBox(
                        width: size.width * 0.15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                            Text('${course[i].coursePercent.toString()}%'),
                          ),
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
                      const Spacer(),
                      Row(
                        children: [
                          Text(course[i].duration.toString()),
                          const Text('Hours')
                        ],
                      )
                    ],
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
