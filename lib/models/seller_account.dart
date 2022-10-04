import 'package:flutter/material.dart';

class SellerAccount {
  final String firstName;
  final String lastName;
  final String password;
  final DateTime dateTime;
  final String gender;
  final String phoneNumber;
  final String email;
  final String address;
  final String bio;
  final String payment;


  SellerAccount({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.dateTime,
    required this.gender,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.bio,
    required this.payment,
  });
}