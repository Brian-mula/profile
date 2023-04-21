import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  String? id;
  String email;
  String username;

  UsersModel({required this.email, required this.username, this.id});

  factory UsersModel.fromJson(DocumentSnapshot<Map<String, dynamic>> map) {
    final data = map.data();
    return UsersModel(
      id: data!['id'],
      email: data['email'],
      username: data['username'],
    );
  }
}
