import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/widgets/department.dart';

class Departments extends ConsumerStatefulWidget {
  const Departments({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DepartmentsState();
}

class _DepartmentsState extends ConsumerState<Departments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/new-department');
        },
        child: Container(
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
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Search in departments...",
                  suffixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.orange.shade600)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.orange.shade600))),
            ),
            const SizedBox(
              height: 30,
            ),
            const DepartmentList()
          ],
        ),
      ),
    );
  }
}
