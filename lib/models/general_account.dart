import 'package:flutter/material.dart';

class GeneralAccount {
  final String typeAccount;
  final String id;
  final String firstName;
  final String lastName;
  final String password;
  final String email;


  GeneralAccount(
      {
        required this.typeAccount,
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.password,
        required this.email
      });



}