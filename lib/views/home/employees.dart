import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/widgets/employees_tab.dart';
import 'package:payroll/widgets/users_tab.dart';

class Employees extends ConsumerStatefulWidget {
  const Employees({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmployeesState();
}

class _EmployeesState extends ConsumerState<Employees> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              text: "Employees",
            ),
            Tab(
              text: "Users",
            )
          ]),
        ),
        body: const TabBarView(children: [EmployeesTab(), UsersTab()]),
      ),
    );
  }
}
