import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_account_model.g.dart'; // Ensure the filename matches

@HiveType(typeId: 10)
class UserAccountModel extends HiveObject {
  @HiveField(0) // Ensure unique ID for each field
  final String userName;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String email;

  // Constructor with named parameters and default values
  UserAccountModel({
    required this.userName,
    required this.password,
    required this.email,
  });

  static void handleErrorState(BuildContext context, String message,
      bool errorState) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: errorState ? Colors.green : Colors.red,
        content: Text("$message"),
      ),
    );
  }
}
