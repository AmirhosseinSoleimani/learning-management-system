import 'package:flutter/material.dart';
import '../../drawer.dart';
import '../my_separator.dart';

class InformationStudentSignUp extends StatelessWidget {
  static const routeName = '/student_information_signup';

  const InformationStudentSignUp({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 35.0
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Image.asset(
                'assets/images/epent_only_logo.png',
                width: 120.0,
                height: 120.0,
                alignment: Alignment.topLeft,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 1.0
            ),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff177FB0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)
                  )
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  const [
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: CircleAvatar(
                            backgroundColor: Color(0xff5DBF23),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 35,
                          child: MySeparator(
                            color: Color(0xffD9D9D9),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: CircleAvatar(
                            backgroundColor: Color(0xff5DBF23),
                            child: null,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 35,
                          child: MySeparator(color: Color(0xffD9D9D9),),
                        ),
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: CircleAvatar(
                            backgroundColor: Color(0xffD9D9D9),
                            child: null,
                            ),
                          ),
                        SizedBox(
                          width: 60,
                          height: 35,
                          child: MySeparator(color: Color(0xffD9D9D9),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: CircleAvatar(
                            backgroundColor: Color(0xffD9D9D9),
                            child: null
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  const [
                        SizedBox(
                          width: 60,
                          height: 30,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 27,
                          height: 30,
                          child: MySeparator(color: Color(0xff177FB0),),
                        ),
                        SizedBox(
                          width: 75,
                          height: 30,
                          child: Text(
                              'Information',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 30,
                          child: MySeparator(color: Color(0xff177FB0),),
                        ),
                        SizedBox(
                          width: 75,
                          height: 30,
                          child: Text(
                              'Information',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 30,
                          child: MySeparator(color: Color(0xff177FB0),),
                        ),
                        SizedBox(
                          width: 60,
                          height: 30,
                          child: Text(
                              'Favourite',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  const [
                        SizedBox(
                          width: 60,
                          height: 1,
                          child:  Divider(
                            color: Color(0xff177FB0),
                          )
                        ),
                        SizedBox(
                          width: 27,
                          height: 1,
                          child: MySeparator(color: Color(0xff177FB0),),
                        ),
                        SizedBox(
                          width: 75,
                          height: 1,
                          child: Divider(
                            thickness: 5,
                            color: Color(0xff5DBF23),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 1,
                          child: MySeparator(color: Color(0xff177FB0),),
                        ),
                        SizedBox(
                          width: 75,
                          height: 1,
                          child: Divider(
                            color: Color(0xff177FB0),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 1,
                          child: MySeparator(color: Color(0xff177FB0),),
                        ),
                        SizedBox(
                          width: 60,
                          height: 1,
                          child: Divider(
                            color: Color(0xff177FB0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
