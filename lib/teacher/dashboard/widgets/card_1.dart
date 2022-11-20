import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tetest/presentation/color_management.dart';
import 'package:tetest/presentation/styles_manager.dart';
import 'package:tetest/presentation/values_manager.dart';

class ChartCart1 extends StatelessWidget {
  const ChartCart1({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: AppSize.s4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.s18),
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: PieChart(
                PieChartData(sections: [
                  PieChartSectionData(
                    color: const Color(0xff5DBF23),
                    value: 15,
                    showTitle: false,
                    radius: 20,
                  ),
                  PieChartSectionData(
                    radius: 20,
                    color: const Color(0xffC94B04),
                    value: 30,
                    showTitle: false,
                  ),
                  PieChartSectionData(
                    color: const Color(0xff177FB0),
                    value: 25,
                    showTitle: false,
                    radius: 20,
                  ),
                  PieChartSectionData(
                      color: const Color(0xffFBBC05),
                      value: 30,
                      showTitle: false,
                      radius: 20),
                ]),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Good job Sarah, keep going!!',
              style: getBoldStyle(
                  color: ColorTeacherPanel.darkGrey, fontSize: AppSize.s16),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ChartPercentageTitle(
                      color: Color(0xff177FB0),
                      title: 'python - 25%',
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const ChartPercentageTitle(
                      color: Color(0xffFBBC05),
                      title: 'css - 15%',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ChartPercentageTitle(
                      color: Color(0xffC94B04),
                      title: 'Html - 30%',
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const ChartPercentageTitle(
                      color: Color(0xff5DBF23),
                      title: 'Data - 30%',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChartPercentageTitle extends StatelessWidget {
  const ChartPercentageTitle({
    required this.color,
    required this.title,
    super.key,
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(100)),
        ),
        const SizedBox(
          width: AppSize.s8,
        ),
        Text(title),
      ],
    );
  }
}
