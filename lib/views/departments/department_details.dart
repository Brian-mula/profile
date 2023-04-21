import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DepartmentDetails extends ConsumerStatefulWidget {
  const DepartmentDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DepartmentDetailsState();
}

class _DepartmentDetailsState extends ConsumerState<DepartmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/departments');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
