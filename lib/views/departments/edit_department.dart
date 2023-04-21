import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payroll/models/department_model.dart';
import 'package:payroll/providers/departments_provider.dart';
import 'package:payroll/providers/users_provider.dart';

class EditDepartment extends ConsumerStatefulWidget {
  const EditDepartment({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditDepartmentState();
}

class _EditDepartmentState extends ConsumerState<EditDepartment> {
  final _formKey = GlobalKey<FormState>();
  String selectedchair = '';
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextEditingController name = TextEditingController();
    TextEditingController chairperson = TextEditingController();

    final departments = ref.watch(departmentsProvider);

    final allUsers = ref.watch(allUsersProvider);
    return Scaffold(
        body: allUsers.when(
            data: (users) => Container(
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
                              DropdownButtonFormField2(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.orange.shade600))),
                                isExpanded: true,
                                hint: Text(
                                  "Select chair",
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(color: Colors.orange.shade600),
                                ),
                                items: users
                                    .map((user) => DropdownMenuItem<String>(
                                          value: user.username,
                                          child: Text(
                                            user.username,
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    color:
                                                        Colors.orange.shade600),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedchair = value!;
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
                                controller: name,
                                decoration: fieldDecoration("e.g Marketing"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Provide department";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 30,
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
                                        DepartmentModel departmentModel =
                                            DepartmentModel(
                                                chairman: selectedchair,
                                                name: name.text);

                                        await departments
                                            .newDepartment(departmentModel);
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        Navigator.pushNamed(
                                            context, '/departments');
                                      }
                                    },
                                    child: _isLoading
                                        ? LoadingAnimationWidget.flickr(
                                            leftDotColor:
                                                const Color(0xFF0063DC),
                                            rightDotColor:
                                                const Color(0xFFFF0084),
                                            size: 50)
                                        : const Text("Add Department")),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
            error: (err, stackTrace) => Center(
                  child: Text(err.toString()),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
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
