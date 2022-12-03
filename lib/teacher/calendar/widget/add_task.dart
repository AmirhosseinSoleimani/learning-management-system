import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../models/task_list.dart';
import './my_text_field.dart';
import '../../presentation/dashboard_color_manager.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String _endTime = '9:30 AM';
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  DateTime _selectedValue = DateTime.now();
  _getDateFromUser() async {
    DateTime? _pickeDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2030));

    if (_pickeDate != null) {
      setState(() {
        _selectedValue = _pickeDate;
      });
    } else {
      return 'no time selected';
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      debugPrint('print time cancled ');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split("")[0]),
      ),
    );
  }

  int _selectedRemind = 0;
  int _selectedColor = 0;
  List<int> remindList = [
    5,
    10,
    15,
    29,
  ];

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      //add to database
      final newTask = Task(
          id: DateTime.now().toString(),
          endTime: _endTime,
          title: _titleController.text,
          note: _noteController.text,
          color: 'red',
          date: _selectedValue.toString(),
          remind: _selectedRemind,
          startTime: _startTime);
      Provider.of<Tasks>(context, listen: false).addTask(newTask);

      debugPrint('ok');
      debugPrint(newTask.title);
      debugPrint(newTask.note);
      debugPrint(newTask.date);

      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar('Required', "All field are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.pink,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ADD Task")),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Task",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              MyTextField(
                title: 'Enter your title',
                controller: _titleController,
              ),
              MyTextField(
                  title: 'Enter your note', controller: _noteController),
              MyTextField(
                title: DateFormat.yMd().format(_selectedValue),
                widget: IconButton(
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.grey[700],
                  ),
                  onPressed: () {
                    debugPrint('clicked');
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: MyTextField(
                    title: _startTime,
                    widget: IconButton(
                      onPressed: () {
                        _getTimeFromUser(isStartTime: true);
                      },
                      icon: const Icon(Icons.access_time),
                    ),
                  )),
                  Expanded(
                      child: MyTextField(
                    title: _endTime,
                    widget: IconButton(
                      onPressed: () {
                        _getTimeFromUser(isStartTime: false);
                      },
                      icon: const Icon(Icons.access_time),
                    ),
                  ))
                ],
              ),
              MyTextField(
                title: '$_selectedRemind minutes early',
                widget: DropdownButton(
                  elevation: 3,
                  underline: Container(height: 0),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRemind = int.parse(newValue!);
                    });
                  },
                  items: remindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Color"),
                      Wrap(
                        children: List.generate(3, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, top: 10),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: index == 0
                                    ? ColorTeacherPanel.boxCalColor
                                    : index == 1
                                        ? Colors.pink[300]
                                        : Colors.amber,
                                child: _selectedColor == index
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 14,
                                      )
                                    : Container(),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _validateData();

                        // items.add(extraTask);
                      },
                      child: const Text('Create Task'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _addTask() {}
}
