import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentModel {
  String? id;
  String name;
  String chairman;

  DepartmentModel({this.id, required this.chairman, required this.name});

  Map<String, dynamic> toFirestore() {
    return {'name': name, 'chairman': chairman};
  }

  factory DepartmentModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return DepartmentModel(
        id: data!['id'], chairman: data['chairman'], name: data['name']);
  }
}
