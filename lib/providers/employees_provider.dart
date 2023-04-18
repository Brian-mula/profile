import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/database/employee_db.dart';
import 'package:payroll/models/employees_model.dart';

final employeesProvider =
    Provider<EmployeeController>((ref) => EmployeeController());

final allEmployeesProvider = StreamProvider<List<EmployeesModel>>((ref) {
  return ref.read(employeesProvider).allEmployees();
});
