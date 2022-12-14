import 'dart:math';
import 'package:flutter/material.dart';
import '../../store/drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarTable extends StatefulWidget {
  static const routeName = '/calendar_table_student';
  const CalendarTable({Key? key}) : super(key: key);

  @override
  State<CalendarTable> createState() => _CalendarTableState();
}

late Map<DateTime, List<Appointment>> _dataCollection;

class _CalendarTableState extends State<CalendarTable> {
  late var _calendarDataSource;

  @override
  void initState() {
    _dataCollection = getAppointments();
    _calendarDataSource = MeetingDataSource(<Appointment>[]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Image.asset(
          'assets/images/epent.png',
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 30.0),
      ),
      endDrawer: const DrawerAppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      body: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
        ),
        dataSource: _calendarDataSource,
        loadMoreWidgetBuilder: (BuildContext context,LoadMoreCallback loadMoreAppointments){
          return FutureBuilder(
            future: loadMoreAppointments(),
              builder: (context,snapShot){
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
              }
          );
        },
      ),
    );
  }
}

Map<DateTime, List<Appointment>> getAppointments() {
  final List<String> _subjectCollection = <String>[];
  _subjectCollection.add('General Meeting');
  _subjectCollection.add('Plan Execution');
  _subjectCollection.add('Project Plan');
  _subjectCollection.add('Consulting');
  _subjectCollection.add('Support');
  _subjectCollection.add('Development Meeting');
  _subjectCollection.add('Scrum');
  _subjectCollection.add('Project Completion');
  _subjectCollection.add('Release updates');
  _subjectCollection.add('Performance Check');

  final List<Color> _colorCollection = <Color>[];
  _colorCollection.add(const Color(0xFF0F8644));
  _colorCollection.add(const Color(0xFF8B1FA9));
  _colorCollection.add(const Color(0xFFD20100));
  _colorCollection.add(const Color(0xFFFC571D));
  _colorCollection.add(const Color(0xFF36B37B));
  _colorCollection.add(const Color(0xFF01A1EF));
  _colorCollection.add(const Color(0xFF3D4FB5));
  _colorCollection.add(const Color(0xFFE47C73));
  _colorCollection.add(const Color(0xFF636363));
  _colorCollection.add(const Color(0xFF0A8043));

  final Random random = Random();
  var _dataCollection = <DateTime, List<Appointment>>{};
  final DateTime today = DateTime.now();
  final DateTime rangeStartDate = DateTime(today.year, today.month, today.day)
      .add(const Duration(days: -1000));
  final DateTime rangeEndDate = DateTime(today.year, today.month, today.day)
      .add(const Duration(days: 1000));
  for (DateTime i = rangeStartDate;
  i.isBefore(rangeEndDate);
  i = i.add(Duration(days: 1 + random.nextInt(2)))) {
    final DateTime date = i;
    final int count = 1 + random.nextInt(3);
    for (int j = 0; j < count; j++) {
      final DateTime startDate = DateTime(
          date.year, date.month, date.day, 8 + random.nextInt(8), 0, 0);
      final int duration = random.nextInt(3);
      final Appointment meeting = Appointment(
          subject: _subjectCollection[random.nextInt(7)],
          startTime: startDate,
          endTime:
          startDate.add(Duration(hours: duration == 0 ? 1 : duration)),
          color: _colorCollection[random.nextInt(9)],
          isAllDay: false);

      if (_dataCollection.containsKey(date)) {
        final List<Appointment> meetings = _dataCollection[date]!;
        meetings.add(meeting);
        _dataCollection[date] = meetings;
      } else {
        _dataCollection[date] = [meeting];
      }
    }
  }
  return _dataCollection;
}

class MeetingDataSource extends CalendarDataSource  {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
  @override
  Future<void> handleLoadMore(DateTime startDate, DateTime endDate) async {
    await Future.delayed(Duration(seconds: 1));
    final List<Appointment> meetings = <Appointment>[];
    DateTime appStartDate = startDate;
    DateTime appEndDate = endDate;

    while (appStartDate.isBefore(appEndDate)) {
      final List<Appointment>? data = _dataCollection[appStartDate];
      if (data == null) {
        appStartDate = appStartDate.add(Duration(days: 1));
        continue;
      }
      for (final Appointment meeting in data) {
        if (appointments!.contains(meeting)) {
          continue;
        }
        meetings.add(meeting);
      }
      appStartDate = appStartDate.add(Duration(days: 1));
    }
    appointments!.addAll(meetings);
    notifyListeners(CalendarDataSourceAction.add, meetings);
  }
}

Future<void> getDataFromFireStore() async {

}

