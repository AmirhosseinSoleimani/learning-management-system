import 'package:flutter/material.dart';
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
}
