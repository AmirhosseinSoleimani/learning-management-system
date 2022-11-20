import 'package:flutter/material.dart';
import 'package:tetest/presentation/color_management.dart';
import 'package:tetest/presentation/styles_manager.dart';
import 'package:tetest/presentation/values_manager.dart';

class TeacherDrawer extends StatefulWidget {
  const TeacherDrawer({Key? key}) : super(key: key);

  @override
  State<TeacherDrawer> createState() => _TeacherDrawerState();
}

class _TeacherDrawerState extends State<TeacherDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: AppSize.s20, vertical: 0),
        child: ListView(children: [
          const Padding(padding: EdgeInsets.zero),
          Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
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
                  width: 50,
                  height: 50,
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
              SizedBox(
                height: size.height * 0.08,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Michal Masiak',
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
                          color: ColorTeacherPanel.darkGrey,
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today",
                          style: getBoldStyle(
                              color: ColorManagement.darkGrey,
                              fontSize: AppSize.s16),
                        )
                      ]),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
