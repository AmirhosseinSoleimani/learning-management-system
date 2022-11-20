import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Bartitle {
  static SideTitles getBottomTitles() => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text;

      switch (value.toInt()) {
        case 0:
          text = 'Course A';
          break;
        case 1:
          text = 'Course B';
          break;
        case 2:
          text = 'Course C';
          break;
        case 3:
          text = 'Course D';
          break;
        case 4:
          text = 'Course E';
          break;
        default:
          text = '';
      }
      return SideTitleWidget(
          space: 8,
          axisSide: meta.axisSide,
          child: Text(
            text,
            style: TextStyle(fontSize: 10),
          ));
    },
  );
}
