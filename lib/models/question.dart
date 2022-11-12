import 'package:flutter/material.dart';

class Question with ChangeNotifier {
  final String id;
  final String title;
  final String description;

  Question({
    required this.id,
    required this.title,
    required this.description,
  });
}
