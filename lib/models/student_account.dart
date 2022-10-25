import 'package:flutter/material.dart';

class StudentAccount {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String gender;
  final String bio;
  final String phoneNumber;
  final DateTime birthdayDate;
  final String country;
  final String introduction;
  final List<String> favouriteCourse;


  StudentAccount(
      {
        required this.email,
        required this.password,
        required this.firstName,
        required this.lastName,
        required this.birthdayDate,
        required this.gender,
        required this.bio,
        required this.phoneNumber,
        required this.country,
        required this.introduction,
        required this.favouriteCourse
      });



}