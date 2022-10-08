import 'package:flutter/material.dart';
import './my_separator.dart';
import 'package:date_time_picker/date_time_picker.dart';



class StudentAddress extends StatefulWidget {
  static const routeName = '/student-address';
  const StudentAddress({Key? key}) : super(key: key);

  @override
  State<StudentAddress> createState() => _StudentAddressState();
}

class _StudentAddressState extends State<StudentAddress> {

  final _form = GlobalKey<FormState>();
  String dropDownValue = 'Male';

  var items = [
    'Male',
    'Female',
    'Non-binary',
    'I prefer not to say'
  ];

  final _phoneNumberFocusNode = FocusNode();
  final _countryFocusNode = FocusNode();

  final _initValues = {
    'phoneNumber': '',
    'country': '',
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios,
                        size: 18.0,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const SizedBox(
                              width: 35,
                              height: 35,
                              child: CircleAvatar(
                                child: Icon(Icons.done,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                              height: 35,
                              child: MySeparator(color: Colors.black,),
                            ),
                            const SizedBox(
                              width: 35,
                              height: 35,
                              child: CircleAvatar(
                                child: Icon(Icons.done,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                              height: 35,
                              child: MySeparator(color: Colors.black,),
                            ),
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade300,
                                child: const Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                              height: 35,
                              child: MySeparator(color: Colors.black,),
                            ),
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade300,
                                child: const Text(
                                  '4',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  const [
                            SizedBox(
                              width: 60,
                              height: 45,
                              child: Text(
                                'Type Account',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: MySeparator(color: Colors.white,),
                            ),
                            SizedBox(
                              width: 60,
                              height: 45,
                              child: Text(
                                  'Verify Email'
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              height: 45,
                              child: MySeparator(color: Colors.white,),
                            ),
                            SizedBox(
                              width: 60,
                              height: 45,
                              child: Text(
                                  'Address'
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              height: 45,
                              child: MySeparator(color: Colors.white,),
                            ),
                            SizedBox(
                              width: 60,
                              height: 45,
                              child: Text(
                                  'Favourite'
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: ListView(
                      children: [
                        const Text(
                          'Please enter your gender',
                          style: TextStyle(
                            fontSize: 18.0
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        DropdownButton(
                          value: dropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items){
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue){
                            setState((){
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Please enter your birthday',
                          style: TextStyle(
                              fontSize: 18.0
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.0,
                              color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: DateTimePicker(
                              initialValue: DateTime.now().toString(),
                              firstDate: DateTime(1995),
                              lastDate: DateTime.now(),
                              dateLabelText: 'Date',
                              onChanged: (val) => print(val),
                              validator: (val) {
                                print(val);
                                return null;
                                },
                              onSaved: (val) => print(val),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            initialValue: _initValues['phoneNumber'],
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide.none
                                ),
                                hintText: 'Phone Number'
                            ),
                            keyboardType: TextInputType.number,
                            focusNode: _phoneNumberFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_countryFocusNode);
                            },
                            validator: (String? value){
                              if(value!.isEmpty){
                                return 'Field is required';
                              }
                              return null;
                            },
                            onSaved: (value){
                            }
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
