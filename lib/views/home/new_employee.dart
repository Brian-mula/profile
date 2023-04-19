import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewEmployee extends ConsumerStatefulWidget {
  const NewEmployee({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends ConsumerState<NewEmployee> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "e",
                  style: theme.textTheme.headlineLarge!
                      .copyWith(color: Colors.orange.shade600),
                ),
                Text(
                  "payroll",
                  style: theme.textTheme.headlineLarge!
                      .copyWith(color: Colors.black87),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
