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
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange.shade600),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          bottom: TabBar(indicatorColor: Colors.blue.shade500, tabs: [
            Tab(
              child: Text(
                "Employees",
                style: theme.textTheme.bodyLarge,
              ),
            ),
            Tab(
              child: Text(
                "Users",
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ]),
        ),
        body: const TabBarView(children: [EmployeesTab(), UsersTab()]),
      ),
    );
  }
}
