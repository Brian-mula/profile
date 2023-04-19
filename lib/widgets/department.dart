import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DepartmentList extends ConsumerStatefulWidget {
  const DepartmentList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DepartmentListState();
}

class _DepartmentListState extends ConsumerState<DepartmentList> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Card(
                  child: ListTile(
                    title: Text(
                      "Department Name",
                      style: theme.textTheme.bodyLarge,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              )),
    );
  }
}
