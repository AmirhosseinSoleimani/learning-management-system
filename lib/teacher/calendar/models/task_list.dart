import 'package:flutter/material.dart';
import '../models/task.dart';

class Tasks extends ChangeNotifier {
  final List<Task> _items = [
    Task(
        id: DateTime.now().toString(),
        endTime: '2:00 PM',
        title: 'this is Second item',
        note: 'no',
        color: 'red',
        date: '11 septamber',
        remind: 5,
        startTime: 'startTime'),
    Task(
        id: DateTime.now().toString(),
        endTime: '2:00 PM',
        title: 'this is first item',
        note: 'no',
        color: 'red',
        date: '11 septamber',
        remind: 5,
        startTime: 'startTime'),
    Task(
        id: DateTime.now().toString(),
        endTime: '2:00 PM',
        title: 'this is Third item',
        note: 'no',
        color: 'red',
        date: '11 septamber',
        remind: 5,
        startTime: 'startTime')
  ];

  List<Task> get items {
    return [..._items];
  }

  void addTask(Task task) {
    _items.add(task);
    notifyListeners();
  }
}
