import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewEmployee extends ConsumerStatefulWidget {
  const NewEmployee({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends ConsumerState<NewEmployee> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = TextEditingController();
    TextEditingController idNumber = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController jobNumber = TextEditingController();
    TextEditingController department = TextEditingController();
    TextEditingController salary = TextEditingController();
    TextEditingController category = TextEditingController();
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
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
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Provide employee details",
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fullname,
                        decoration: fieldDecoration("Full name"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: idNumber,
                        keyboardType: TextInputType.number,
                        decoration: fieldDecoration("ID number"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        decoration: fieldDecoration("Phone"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: jobNumber,
                        keyboardType: TextInputType.text,
                        decoration: fieldDecoration("Job Number"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: department,
                        keyboardType: TextInputType.text,
                        decoration: fieldDecoration("Department"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: fieldDecoration("Salary"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: category,
                        keyboardType: TextInputType.number,
                        decoration: fieldDecoration("Category"),
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
                            child: const Text("Add Employee")),
                      )
                    ],
                  ))
            ],
          ),
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
