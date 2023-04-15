import 'package:flutter/material.dart';
import 'package:payroll/connection.dart';
import 'package:payroll/views/auth/login.dart';
import 'package:payroll/views/auth/register.dart';
import 'package:payroll/views/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/connection',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/connection': (context) => const Connection()
      },
    );
  }
}
