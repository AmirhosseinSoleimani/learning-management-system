import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../../calendar/models/task_list.dart';
import '../../calendar/widget/add_task.dart';
import '../../presentation/dashboard_styles_manager.dart';
import '../../presentation/dashboard_color_manager.dart';
import '../../presentation/dashboard_value_manager.dart';

class TeacherDrawer extends StatefulWidget {
  const TeacherDrawer({Key? key}) : super(key: key);

  @override
  State<TeacherDrawer> createState() => _TeacherDrawerState();
}

class _TeacherDrawerState extends State<TeacherDrawer> {
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Tasks>(context).items;
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: ListView(children: [
              const Padding(padding: EdgeInsets.all(10.0)),
              Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(AppSize.s20),
                        border: Border.all(
                            width: 1, color: ColorTeacherPanel.boxNotifColor),
                      ),
                      child: Stack(alignment: Alignment.center, children: [
                        const Icon(
                          Icons.notifications_none,
                          size: 30,
                        ),
                        Positioned(
                            top: 1,
                            right: 1.5,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: ColorTeacherPanel.boxColorGreen,
                                  borderRadius: BorderRadius.circular(AppSize.s8)),
                            ))
                      ]),
                    ),
                    trailing: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(AppSize.s20),
                        border: Border.all(
                            width: 1, color: ColorTeacherPanel.boxNotifColor),
                      ),
                      child: Stack(alignment: Alignment.center, children: const [
                        Icon(
                          Icons.settings,
                          size: 30,
                        ),
                      ]),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '${Provider.of<SignInProvider>(context,listen: false).userInformation[0].firstName}' + ' ' +Provider.of<SignInProvider>(context,listen: false).userInformation[0].lastName,
                          style: getBoldStyle(
                              color: ColorTeacherPanel.darkGrey,
                              fontSize: AppSize.s20),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          "AnywhereWork",
                          style: getRegularStyle(
                              color: ColorManager.lightSteelBlue1,
                              fontSize: AppSize.s18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Card(
                    elevation: AppSize.s4,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.s4),
                      child: SingleChildScrollView(
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
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
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
}
