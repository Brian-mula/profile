import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/database/department_db.dart';
import 'package:payroll/models/department_model.dart';

final departmentsProvider = Provider<DepartmentController>((ref) {
  return DepartmentController();
});

final allDepartmentsProvider = StreamProvider<List<DepartmentModel>>((ref) {
  return ref.read(departmentsProvider).allDepartments();
});
