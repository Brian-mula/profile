import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/models/department_model.dart';

class DepartmentList extends ConsumerStatefulWidget {
  const DepartmentList({super.key, required this.departments});
  final List<DepartmentModel> departments;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DepartmentListState();
}

class _DepartmentListState extends ConsumerState<DepartmentList> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 650,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
          itemCount: widget.departments.length,
          itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Card(
                  child: ListTile(
                    title: Text(
                      widget.departments[index].name,
                      style: theme.textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      widget.departments[index].chairman,
                      style: theme.textTheme.bodySmall,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              )),
    );
  }
}
