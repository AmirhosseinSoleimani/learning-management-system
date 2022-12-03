import 'package:flutter/material.dart';
import 'package:learning_management_system/provider/section_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../widgets/add_section.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../widgets/edit_section.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  
  @override
  Widget build(BuildContext context) {
    final sectionList = Provider.of<SectionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: AppSize.s20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.addCourseTitle);
          },
        ),
        title: Image.asset(
          ImageAssets.epent,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.black, size: AppSize.s30),
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(
                context: context, builder: (context) => const AddSection());
            }, icon: const Icon(Icons.add,size: 25.0,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
              width: 2,
              color: ColorManager.lightSteelBlue2
              ),
              borderRadius: BorderRadius.circular(10.0),
              color: ColorManager.white,
              boxShadow: [
                BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3),
              )
              ]
            ),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: ListView.builder(
                      itemCount: sectionList.courseSection.length,
                      itemBuilder: (context,index) {
                          return Slidable(
                            key: const ValueKey(1),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              dismissible: DismissiblePane(onDismissed: () {}),
                              children: [
                                SlidableAction(
                                  onPressed: (value){
                                    delete(context, index);
                                  },
                                  backgroundColor: ColorManager.error,
                                  foregroundColor: ColorManager.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    // An action can be bigger than the others.
                                    onPressed: (value){
                                      edit(context,index);
                                    },
                                    backgroundColor: ColorManager.primary,
                                    foregroundColor: ColorManager.white,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  ),
                                ],
                            ),
                            child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: ColorManager.lightSteelBlue2
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: ColorManager.lightSteelBlue5
                              ),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    sectionList.courseSection[index].sectionName,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.slateGray2
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Routes.addCoursePricing);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            ColorManager.primary,
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(50.0)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: ColorManager.white,
                              size: 30,
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void delete(BuildContext context,int index){
    // Provider.of<CourseSectionProvider>(context,listen: false).deleteCourseSectionTitle(index);
  }
  void edit(BuildContext context,int index){
    showModalBottomSheet(
        context: context, builder: (context) => EditSection(index: index,));
  }
}
