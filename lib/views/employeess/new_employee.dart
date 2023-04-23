import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payroll/models/employees_model.dart';
import 'package:payroll/providers/departments_provider.dart';
import 'package:payroll/providers/employees_provider.dart';

class NewEmployee extends ConsumerStatefulWidget {
  const NewEmployee({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends ConsumerState<NewEmployee> {
  final _formKey = GlobalKey<FormState>();
  String? selectedDep;
  List<String> categories = ["Full time", "Part time", "Intern"];
  String? selectedCat;
  @override
  Widget build(BuildContext context) {
    TextEditingController fullname = TextEditingController();
    TextEditingController idNumber = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController jobNumber = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController salary = TextEditingController();
    TextEditingController role = TextEditingController();
    ThemeData theme = Theme.of(context);

    final departments = ref.watch(allDepartmentsProvider);
    final employee = ref.watch(employeesProvider);

    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: departments.when(
              data: (departmentData) => Container(
                    padding:
                        const EdgeInsets.only(top: 80, left: 10, right: 10),
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
                                DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange.shade600))),
                                  isExpanded: true,
                                  hint: Text(
                                    "Select category",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.orange.shade600),
                                  ),
                                  items: categories
                                      .map((cat) => DropdownMenuItem<String>(
                                            value: cat,
                                            child: Text(
                                              cat,
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: Colors
                                                          .orange.shade600),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCat = value;
                                    });
                                  },
                                  dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                  buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      )),
                                  iconStyleData: IconStyleData(
                                      icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 30,
                                    color: Colors.orange.shade600,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange.shade600))),
                                  isExpanded: true,
                                  hint: Text(
                                    "Select Department",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                        color: Colors.orange.shade600),
                                  ),
                                  items: departmentData
                                      .map((dept) => DropdownMenuItem<String>(
                                            value: dept.name,
                                            child: Text(
                                              dept.name!,
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: Colors
                                                          .orange.shade600),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDep = value;
                                    });
                                  },
                                  dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                  buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      )),
                                  iconStyleData: IconStyleData(
                                      icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 30,
                                    color: Colors.orange.shade600,
                                  )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: fullname,
                                  decoration: fieldDecoration("Full name"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter full name";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: idNumber,
                                  keyboardType: TextInputType.number,
                                  decoration: fieldDecoration("ID number"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please fill out the ID field";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: phone,
                                  keyboardType: TextInputType.phone,
                                  decoration: fieldDecoration("Phone"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "provide phone number";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: jobNumber,
                                  keyboardType: TextInputType.text,
                                  decoration: fieldDecoration("Job Number"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Provide job number";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: salary,
                                  keyboardType: TextInputType.number,
                                  decoration: fieldDecoration("Salary"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Provide agreed salary";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: fieldDecoration("e.g a@b.com"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Provide email address";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: role,
                                  keyboardType: TextInputType.text,
                                  decoration:
                                      fieldDecoration("e.g data dealers"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Provide agreed role";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.orange.shade600),
                                          elevation:
                                              MaterialStateProperty.all(0.0)),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          EmployeesModel employeesModel =
                                              EmployeesModel(
                                                  category: selectedCat!,
                                                  fullName: fullname.text,
                                                  date: DateFormat('yyyy-MM-dd')
                                                      .format(DateTime.now()),
                                                  department: selectedDep!,
                                                  email: email.text,
                                                  idNumber: idNumber.text,
                                                  jobNo: jobNumber.text,
                                                  phone: phone.text,
                                                  role: role.text,
                                                  salary: double.parse(
                                                      salary.text));
                                          await employee
                                              .newEmployee(employeesModel);
                                        }
                                      },
                                      child: const Text("Add Employee")),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
              error: (err, stackTrace) => Text(err.toString()),
              loading: () => Center(
                  child: LoadingAnimationWidget.flickr(
                      leftDotColor: const Color(0xFF0063DC),
                      rightDotColor: const Color(0xFFFF0084),
                      size: 100)))),
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
