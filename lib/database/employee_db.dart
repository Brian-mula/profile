import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payroll/models/employees_model.dart';

class EmployeeController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference employees =
      FirebaseFirestore.instance.collection('employees');

  // !get a list of all employees from the database
  // usually it will be used by senior managers

  Stream<List<EmployeesModel>> allEmployees() {
    return employees.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return EmployeesModel.fromFirestore(
            doc as DocumentSnapshot<Map<String, dynamic>>);
      }).toList();
    });
  }

  // ! add new employee
  // it will only be done by HR manager
  Future<void> newEmployee(EmployeesModel employeesModel) async {
    try {
      await employees.add(employeesModel.toFirestore());
    } catch (e) {
      print(e.toString());
    }
  }

// ! editing employee information
// done by HR
  Future<void> updateEmployee(EmployeesModel employeesModel, String id) async {
    try {
      await employees.doc(id).update(employeesModel.toFirestore());
    } catch (e) {
      print(e.toString());
    }
  }
  // !deleting an employee
  // ? done by HR

  Future<void> removeEmployee(String id) async {
    try {
      await employees.doc(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
