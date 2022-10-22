import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learning_management_system/student/screens/user_info_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final String userInfoHiveBox = 'userInfo';
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _cityController  = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Form(
        key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'FullName'
                  ),
                  controller: _fullNameController,
                  keyboardType: TextInputType.name,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Age'
                  ),
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'City'
                  ),
                  controller: _cityController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          _saveData();
                        }
                      },
                      child: const Text(
                        'Save Data'
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                        _loadData();
                    },
                    child: const Text(
                        'Load from cache'
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  } // end build
  void _saveData() async{
    debugPrint('save data');
    String fullName = _fullNameController.text;
    String age = _ageController.text;
    String city = _cityController.text;
    var user = UserInfo(
      fullName: fullName,
      age: age,
      city: city
    );
    var box = await Hive.openBox<UserInfo>(userInfoHiveBox);
    box.put('user', user);
    box.close();

  }

  void _loadData() async{
    debugPrint('Load data');
    var box = await Hive.openBox(userInfoHiveBox);
    UserInfo user = box.get('user');
    _fullNameController.text = user.fullName;
    _ageController.text = user.age.toString();
    _cityController.text = user.city;
    box.close();
    setState((){});
  }
}
