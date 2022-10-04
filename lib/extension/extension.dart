import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double widthResponse(double percentage,double min,double max) => MediaQuery.of(this).size.width * percentage < min ? min : MediaQuery.of(this).size.width > max ? max : MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  void routePage(Widget child) => Navigator.of(this).push(MaterialPageRoute(builder: (context) => child));
}

extension StringExtension on String {
  Widget toLabel({double? fontSize, Color? color, bool bold = false}) => MLabel(
    title: replaceAll('Exception:', ''),
    bold: bold,
    fontSize: fontSize,
    color: color,
  );
}

extension WidgetExtension on Widget {
  Widget get vMargin3 => Container(
    margin: const EdgeInsets.symmetric(vertical: 3.0),
    child: this,
  );
  Widget get vMargin6 => Container(
    margin: const EdgeInsets.symmetric(vertical: 6.0),
    child: this,
  );
  Widget get vMargin9 => Container(
    margin: const EdgeInsets.symmetric(vertical: 9.0),
    child: this,
  );
  Widget get hMargin3 => Container(
    margin: const EdgeInsets.symmetric(horizontal: 3.0),
    child: this,
  );
  Widget get hMargin6 => Container(
    margin: const EdgeInsets.symmetric(horizontal: 6.0),
    child: this,
  );
  Widget get hMargin9 => Container(
    margin: const EdgeInsets.symmetric(horizontal: 9.0),
    child: this,
  );
  Widget get margin3 => Container(
    margin: const EdgeInsets.all(3.0),
    child: this,
  );
  Widget get margin6 => Container(
    margin: const EdgeInsets.all(6.0),
    child: this,
  );
  Widget get margin9 => Container(
    margin: const EdgeInsets.all(9.0),
    child: this,
  );
  Widget get vPadding3 => Container(
    padding: const EdgeInsets.symmetric(vertical: 3.0),
    child: this,
  );
  Widget get vPadding6 => Container(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: this,
  );
  Widget get vPadding9 => Container(
    padding: const EdgeInsets.symmetric(vertical: 9.0),
    child: this,
  );
  Widget get hPadding3 => Container(
    padding: const EdgeInsets.symmetric(horizontal: 3.0),
    child: this,
  );
  Widget get hPadding6 => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    child: this,
  );
  Widget get hPadding9 => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9.0),
    child: this,
  );
  Widget get padding3 => Container(
    padding: const EdgeInsets.all(3.0),
    child: this,
  );
  Widget get padding6 => Container(
    padding: const EdgeInsets.all(6.0),
    child: this,
  );
  Widget get padding9 => Container(
    padding: const EdgeInsets.all(9.0),
    child: this,
  );

  Widget get card => Card(child: this);
  Widget get center => Center(child: this);
  Widget get expand => Expanded(child: this);

}

