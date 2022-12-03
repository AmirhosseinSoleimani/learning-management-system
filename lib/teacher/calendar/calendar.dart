import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import './models/task_list.dart';
import './widget/add_task.dart';
import '../presentation/dashboard_color_manager.dart';
import '../presentation/dashboard_styles_manager.dart';
import '../presentation/dashboard_value_manager.dart';

class MyCalendar extends StatefulWidget {
  MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Tasks>(context).items;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _app(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _addTaskPart(),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: DatePicker(
                    DateTime.now(),
                    width: 60,
                    initialSelectedDate: DateTime.now(),
                    height: 100,
                    selectionColor: ColorTeacherPanel.boxCalColor,
                    onDateChange: (date) {
                      _selectedValue = date;
                    },
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (ctx, i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                            color: ColorTeacherPanel.cardColorMain,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(AppSize.s12)),
                        child: Row(children: [
                          Container(
                              width: 10,
                              decoration: BoxDecoration(
                                  color: ColorTeacherPanel.cardColorLeftBorde,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(AppSize.s12),
                                      topLeft: Radius.circular(AppSize.s12)))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  providerData[i].title,
                                  style: getRegularStyle(
                                      fontSize: AppSize.s16,
                                      color: ColorTeacherPanel.cardColorLeftBorde),
                                ),
                                Text(
                                  providerData[i].note,
                                  style: getBoldStyle(
                                      color: ColorTeacherPanel.text_2,
                                      fontSize: AppSize.s16),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/acctime.svg',
                                      color: ColorTeacherPanel.boxNotifColor,
                                      width: 15,
                                      height: 15,
                                    ),
                                    const SizedBox(
                                      width: AppSize.s12,
                                    ),
                                    Text(
                                      '${providerData[i].startTime}-${providerData[i].endTime}',
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                    itemCount: providerData.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Padding(
//       padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
//       child: Container(
//         width: double.infinity,
//         height: 80,
//         decoration: BoxDecoration(
//             color: ColorTeacherPanel.cardColorMain,
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(AppSize.s12)),
//         child: Row(children: [
//           Container(
//               width: 10,
//               decoration: BoxDecoration(
//                   color: ColorTeacherPanel.cardColorLeftBorde,
//                   borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(AppSize.s12),
//                       topLeft: Radius.circular(AppSize.s12)))),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   status,
//                   style: getRegularStyle(
//                       fontSize: AppSize.s16,
//                       color: ColorTeacherPanel.cardColorLeftBorde),
//                 ),
//                 Text(
//                   title,
//                   style: getBoldStyle(
//                       color: ColorTeacherPanel.text_2, fontSize: AppSize.s16),
//                 ),
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/svg/acctime.svg',
//                       color: ColorTeacherPanel.boxNotifColor,
//                       width: 15,
//                       height: 15,
//                     ),
//                     const SizedBox(
//                       width: AppSize.s12,
//                     ),
//                     Text(
//                       '${startHour}AM-${endHour}AM',
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ]),
//       ),
//     );

_addTaskPart() {
  return Container(
    margin: const EdgeInsets.only(left: 30, top: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
            ),
            const Text(
              "Today",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () => Get.to(() => AddTask()),
            child: const Text('Add Task'))
      ],
    ),
  );
}

_app() {
  return AppBar(
    title: const Text('Text part'),
    leading: IconButton(
        onPressed: () {
          debugPrint('Clicked');
        },
        icon: const Icon(Icons.calendar_month)),
  );
}
