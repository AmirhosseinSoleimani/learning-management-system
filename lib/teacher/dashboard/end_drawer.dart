import 'package:flutter/material.dart';

import '../../presentation/resources/routes_manager.dart';
// import '../chat/chat.dart';
// import '../chat/model/ChatModel.dart';
// import '../chat/screens/Homescreen.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();

}
String dropDownValue = 'English';
var items = ['English', 'فارسی'];

class _EndDrawerState extends State<EndDrawer> {
  // ChatModel? sourceChat;
  // List<ChatModel> chatmodels = [
  // ChatModel(
  // name: "Dev Stack",
  // isGroup: false,
  // currentMessage: "Hi Everyone",
  // time: "4:00",
  // icon: "person.svg",
  // id: 1,
  // ),
  // ChatModel(
  // name: "Kishor",
  // isGroup: false,
  // currentMessage: "Hi Kishor",
  // time: "13:00",
  // icon: "person.svg",
  // id: 2,
  // ),
  //
  // ChatModel(
  // name: "Collins",
  // isGroup: false,
  // currentMessage: "Hi Dev Stack",
  // time: "8:00",
  // icon: "person.svg",
  // id: 3,
  // ),
  //
  // ChatModel(
  // name: "Balram Rathore",
  // isGroup: false,
  // currentMessage: "Hi Dev Stack",
  // time: "2:00",
  // icon: "person.svg",
  // id: 4,
  // )];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: (){
                Navigator.of(context).pushReplacementNamed(Routes.addCourseLayout);
              },
            ),
            ListTile(
              title: const Text('Find Master'),
              onTap: (){},
            ),
            ListTile(
              title: const Text('Teaching'),
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()
                // );

              },
            ),
            ListTile(
              title: const Text('Courses'),
              onTap: (){},
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.08,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0))),
                value: dropDownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
