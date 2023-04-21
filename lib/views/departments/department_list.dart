import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payroll/providers/departments_provider.dart';
import 'package:payroll/widgets/department.dart';

class Departments extends ConsumerStatefulWidget {
  const Departments({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DepartmentsState();
}

class _DepartmentsState extends ConsumerState<Departments> {
  @override
  Widget build(BuildContext context) {
    final alldepartments = ref.watch(allDepartmentsProvider);
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
        body: alldepartments.when(
            data: (departments) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 60),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Search in departments...",
                              suffixIcon: const Icon(Icons.search),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.orange.shade600)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.orange.shade600))),
                          onChanged: (value) {
                            ref.read(allDepartmentsProvider).whenData(
                                (departments) => departments.where(
                                    (department) => department.name
                                        .toLowerCase()
                                        .contains(value.toLowerCase())));
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                              itemCount: departments.length,
                              itemBuilder: (context, index) {
                                return Text(departments[index].name);
                              }),
                        ),
                        DepartmentList(
                          departments: departments,
                        ),
                      ],
                    ),
                  ),
                ),
            error: (err, stackTrace) => Text(err.toString()),
            loading: () => Center(
                child: LoadingAnimationWidget.flickr(
                    leftDotColor: const Color(0xFF0063DC),
                    rightDotColor: const Color(0xFFFF0084),
                    size: 100))));
  }
}
