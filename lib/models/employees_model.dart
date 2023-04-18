import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeesModel {
  String? id;
  String fullName;
  String email;
  String idNumber;
  String phone;
  String jobNo;
  String department;
  String category;
  String role;
  String date;
  double salary;

  EmployeesModel(
      {this.id,
      required this.category,
      required this.fullName,
      required this.date,
      required this.department,
      required this.email,
      required this.idNumber,
      required this.jobNo,
      required this.phone,
      required this.role,
      required this.salary});

  Map<String, dynamic> toFirestore() {
    return {
      'fullName': fullName,
      'email': email,
      'idNumber': idNumber,
      'jobNo': jobNo,
      'phone': phone,
      'role': role,
      'salary': salary,
    };
  }

  factory EmployeesModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return EmployeesModel(
        id: data!['id'],
        category: data['category'],
        fullName: data['fullName'],
        date: data['date'],
        department: data['department'],
        email: data['email'],
        idNumber: data['idNumber'],
        jobNo: data['jobNo'],
        phone: data['phone'],
        role: data['role'],
        salary: data['salary']);
  }
}
