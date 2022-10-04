import 'package:flutter/material.dart';

class StudentAccount {
  final String id;
  final String firstName;
  final String lastName;
  final String password;
  final DateTime dateTime;
  final String gender;
  final String phoneNumber;
  final String email;
  final String country;


  StudentAccount(
      {
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.dateTime,
        required this.password,
        required this.gender,
        required this.country,
        required this.phoneNumber,
        required this.email
      });



}