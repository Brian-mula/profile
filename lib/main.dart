import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/connection.dart';
import 'package:payroll/firebase_options.dart';
import 'package:payroll/views/auth/login.dart';
import 'package:payroll/views/auth/register.dart';
import 'package:payroll/views/departments/department_list.dart';
import 'package:payroll/views/departments/edit_department.dart';
import 'package:payroll/views/departments/new_department.dart';
import 'package:payroll/views/home/employee_details.dart';
import 'package:payroll/views/home/employees.dart';
import 'package:payroll/views/home/homepage.dart';
import 'package:payroll/views/home/main_home_page.dart';
import 'package:payroll/views/home/new_employee.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/connection',
      routes: {
        '/home': (context) => const HomePage(),
        '/': (context) => const MainHomePage(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/connection': (context) => const Connection(),
        '/employee-details': (context) => const EmployeeDetails(),
        '/main-home': (context) => const MainHomePage(),
        '/new-employee': (context) => const NewEmployee(),
        '/departments': (context) => const Departments(),
        '/new-department': (context) => const NewDepartment(),
        '/employees': (context) => const Employees(),
        '/edit-department': (context) => const EditDepartment()
      },
    );
  }
}
