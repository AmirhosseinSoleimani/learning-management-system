import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentAccount {
  final String userName;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final int gender;
  final String bio;
  final String phoneNumber;
  final int birthdayDate;
  final String country;
  final String introduction;
  final List<String> favouriteCourse;


  StudentAccount(
      {
        required this.userName,
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