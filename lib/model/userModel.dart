import 'package:task2/shared/sqfliteHelper.dart';

class UserModel {
  final int id;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      id: parsedJson[DatabaseHelper.columnId],
      email: parsedJson[DatabaseHelper.columnEmail],
      password: parsedJson[DatabaseHelper.columnPassword],
    );
  }
}
