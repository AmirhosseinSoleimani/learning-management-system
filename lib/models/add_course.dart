import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String name;
  String image;
  double price;
  String duration;
  String session;
  String review;
  bool isSelected;
  String description;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.duration,
    required this.session,
    required this.review,
    required this.isSelected,
    required this.description,
});
}