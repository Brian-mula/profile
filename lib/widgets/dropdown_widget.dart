import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payroll/providers/departments_provider.dart';

class DepartmentDopDown extends ConsumerStatefulWidget {
  const DepartmentDopDown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DepartmentDopDownState();
}

class _DepartmentDopDownState extends ConsumerState<DepartmentDopDown> {
  String? selectedDep;
  @override
  Widget build(BuildContext context) {
    final departments = ref.watch(allDepartmentsProvider);
    ThemeData theme = Theme.of(context);
    return Container(
      child: departments.when(
          data: (departmentData) => DropdownButtonFormField2(
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade600))),
                isExpanded: true,
                hint: Text(
                  "Select Department",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Colors.orange.shade600),
                ),
                items: departmentData
                    .map((dept) => DropdownMenuItem<String>(
                          value: dept.name,
                          child: Text(
                            dept.name!,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: Colors.orange.shade600),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDep = value;
                  });
                },
                dropdownStyleData: DropdownStyleData(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(6))),
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
          error: (err, stackTrace) => Text(err.toString()),
          loading: () => Center(
              child: LoadingAnimationWidget.flickr(
                  leftDotColor: const Color(0xFF0063DC),
                  rightDotColor: const Color(0xFFFF0084),
                  size: 100))),
    );
  }
}
