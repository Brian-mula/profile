import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payroll/providers/employees_provider.dart';

class EmployeesTab extends ConsumerStatefulWidget {
  const EmployeesTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmployeesTabState();
}

class _EmployeesTabState extends ConsumerState<EmployeesTab> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final employees = ref.watch(allEmployeesProvider);
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: employees.when(
            data: (employee) => ListView.builder(
                itemCount: employee.length,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/employee-details',
                              arguments: employee[index]);
                        },
                        child: Card(
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2018/08/24/20/21/cat-3628801__340.jpg"),
                              backgroundColor: Colors.blue,
                            ),
                            title: Text(
                              employee[index].fullName,
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: Colors.black87),
                            ),
                            subtitle: Text(
                              employee[index].category,
                              style: theme.textTheme.bodySmall,
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black54,
                                  size: 30,
                                )),
                          ),
                        ),
                      ),
                    )),
            error: (err, stackTrace) => Text(err.toString()),
            loading: () => Center(
                child: LoadingAnimationWidget.flickr(
                    leftDotColor: const Color(0xFF0063DC),
                    rightDotColor: const Color(0xFFFF0084),
                    size: 100))));
  }
}
