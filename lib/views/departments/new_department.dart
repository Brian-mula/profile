import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewDepartment extends ConsumerStatefulWidget {
  const NewDepartment({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewDepartmentState();
}

class _NewDepartmentState extends ConsumerState<NewDepartment> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextEditingController name = TextEditingController();
    TextEditingController chairperson = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 10,
          right: 10,
        ),
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
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Enter department Details",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: fieldDecoration("e.g Marketing"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: chairperson,
                      decoration: fieldDecoration("Chairman"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.orange.shade600),
                              elevation: MaterialStateProperty.all(0.0)),
                          onPressed: () {},
                          child: const Text("Add Department")),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  InputDecoration fieldDecoration(String label, [IconData? iconData]) {
    return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.orange.shade600),
        suffixIcon: Icon(iconData),
        focusColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(color: Colors.orange.shade600, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(color: Colors.orange.shade800, width: 1.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.orange.shade600, width: 1.0)));
  }
}