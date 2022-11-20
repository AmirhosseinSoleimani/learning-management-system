import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tetest/presentation/color_management.dart';
import 'package:tetest/presentation/styles_manager.dart';
import 'package:tetest/presentation/values_manager.dart';
import 'package:tetest/teacherPanel/models/bar_models_chart.dart';
import 'package:tetest/teacherPanel/widgets/bar_title.dart';

class ThirdCard extends StatelessWidget {
  const ThirdCard({
    super.key,
    required this.size,
    required this.bardData,
  });

  final Size size;
  final List<BardData> bardData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSize.s18),
        child: Column(
          children: [
            Text(
              "All Student who buy the course",
              style:
              getBoldStyle(color: ColorTeacherPanel.darkGrey, fontSize: 18),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              padding: const EdgeInsets.only(right: AppSize.s20),
              height: 200,
              child: BarChart(
                BarChartData(
                    borderData: FlBorderData(
                        border: Border.all(
                            color: ColorTeacherPanel.chartColorBorder)),
                    gridData: FlGridData(drawVerticalLine: false),
                    maxY: 120,
                    groupsSpace: 12,
                    barGroups: bardData
                        .map((data) => BarChartGroupData(x: data.id, barRods: [
                      BarChartRodData(
                        color: data.color,
                        toY: data.y,
                      )
                    ]))
                        .toList(),
                    titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: Bartitle.getBottomTitles()))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
