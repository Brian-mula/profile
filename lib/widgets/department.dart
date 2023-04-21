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
  void updateList(String value) {
    setState(() {
      widget.departments
          .where((department) =>
              department.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
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
            onChanged: (String value) => updateList(value),
          ),
          SizedBox(
            height: 750,
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
          ),
        ],
      ),
    );
  }
}
