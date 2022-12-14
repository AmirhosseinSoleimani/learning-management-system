import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../models/help_model.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../../provider/sign_in_provider.dart';
import '../presentation/dashboard_color_manager.dart';
class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  String text = 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.';
  bool isReadMore = false;
  bool isExtract = false;
  final List<HelpModel> _help = [
    HelpModel(
        title: 'Start',
        icon: IconAssets.start,
        text: 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
    ),
    HelpModel(
        title: 'Build Site',
        icon: IconAssets.buildSite,
        text: 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
    ),
    HelpModel(
        title: 'Build Mobile App',
        icon: IconAssets.mobileApp,
        text: 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
    ),
    HelpModel(
        title: 'Sell',
        icon: IconAssets.sell,
        text: 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
    ),
    HelpModel(
        title: 'Report',
        icon: IconAssets.report,
        text: 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
    ),HelpModel(
        title: 'Manage',
        icon: IconAssets.manage,
        text: 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
    ),
    HelpModel(
        title: 'Integrate',
        icon: IconAssets.integrate,
        text: 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
    ),
    HelpModel(
        title: 'manage account',
        icon: IconAssets.manageAccount,
        text: 'It is a long established fact that a reader will be distracted by the readable content er the years, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
    ),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: AppSize.s20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.teacherDashboard);
          },
        ),
        title: Image.asset(
          ImageAssets.epent,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.black, size: AppSize.s30),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Welcome ${Provider.of<SignInProvider>(context,listen: false).userInformation[0].firstName} ${Provider.of<SignInProvider>(context,listen: false).userInformation[0].lastName}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.slateGray2,
                          )
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'AnywhereWorks - dashboard',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.lightSteelBlue1
                        )
                      )
                    ],
                  ),
                  InkWell(
                    radius: 12,
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Container(
                      width: 55,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          border: Border.all(
                              color: ColorTeacherPanel.searchContainer,
                              width: AppSize.s1_5)),
                      child: const Icon(Icons.search),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: (isExtract == true && isReadMore == false) ? 1250.0: (isReadMore == true && isExtract == false) ? 1160 : (isReadMore && isExtract) ? 1350 : 1050,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: ColorManager.white
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorManager.white,
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.black,
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'How Can we Help You Today?',
                        style: TextStyle(
                          color: ColorManager.slateGray2,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorManager.lightSteelBlue2,
                            ),
                          ),
                          filled: true,
                          fillColor: ColorManager.lightSteelBlue3,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                width: 2, color: ColorManager.lightSteelBlue2),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconAssets.search
                            ),
                          ),
                          hintText: 'Enter Your Search Term Here...',
                          hintStyle: TextStyle(
                            color: ColorManager.lightSteelBlue1,
                            fontSize: 16.0,
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                      child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                ColorManager.primary,
                              ),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Search',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.white),
                                ),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: (isExtract == true && isReadMore == false)? 1000: (isReadMore == true && isExtract == false) ? 900 : (isReadMore && isExtract) ? 1110 : 800,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ColorManager.lightSteelBlue3,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        color: ColorManager.lightSteelBlue3,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Learn How To...',
                              style: TextStyle(
                                color: ColorManager.slateGray2,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Container(
                              height: isReadMore ? 275:155,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: ColorManager.white,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: ColorManager.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'trending',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          color: ColorManager.slateGray2
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3.0,
                                      ),
                                      SvgPicture.asset(
                                          IconAssets.fire,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                              color: ColorManager.black,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: isReadMore ? 10:4,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                isReadMore =! isReadMore;
                                              });
                                            },
                                            child: Text(
                                              isReadMore ? 'Show less...':
                                              'Show more...',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: ColorManager.primary,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: isExtract? 760 : 550,
                            width: double.infinity,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _help.length,
                              itemBuilder: (context,index){
                                return Card(
                                  child: ExpansionTile(
                                    onExpansionChanged: (value){
                                      setState(() {
                                        isExtract =! isExtract;
                                      });
                                      print(isExtract);
                                    },
                                    leading: Container(
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: const Color(0xffD9EEFF),
                                          ),
                                          color: const Color(0xffD9EEFF),
                                          borderRadius: BorderRadius.circular(50.0)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(_help[index].icon),
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _help[index].title,
                                        style: TextStyle(
                                            color: ColorManager.slateGray2,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0
                                        ),
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: ColorManager.lightSteelBlue1,
                                      size: 30.0,
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 200,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1
                                            ),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              text,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: ColorManager.slateGray2,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
