import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payroll/models/department_model.dart';

class DepartmentController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _departments =
      FirebaseFirestore.instance.collection('departments');

  // ! get a stream of all departments
  // can be accessed by both employees and employers

  Stream<List<DepartmentModel>> allDepartments() {
    return _departments.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DepartmentModel.fromFirestore(
            doc as DocumentSnapshot<Map<String, dynamic>>);
      }).toList();
    });
  }

  // !create a new department
  // usually done by management

  Future<void> newDepartment(DepartmentModel departmentModel) async {
    try {
      await _departments.add(departmentModel.toFirestore());
    } catch (e) {
      print(e.toString());
    }
  }

// !edit a department
// done by management

  Future<void> editDepartment(
      DepartmentModel departmentModel, String id) async {
    try {
      print(id);
      await _departments.doc(id).update(departmentModel.toFirestore());
    } catch (e) {
      print(e.toString());
    }
  }
  // ! delete a department
  //  done by management

  Future<void> removeDepartment(String id) async {
    try {
      await _departments.doc(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
