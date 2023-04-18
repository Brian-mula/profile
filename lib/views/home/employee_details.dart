import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeeDetails extends ConsumerStatefulWidget {
  const EmployeeDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmployeeDetailsState();
}

class _EmployeeDetailsState extends ConsumerState<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: const Icon(Icons.arrow_back_ios_new_sharp)),
                    Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        "Employee details",
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.orange.shade600),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 10,
                  right: 10,
                  top: 180,
                  child: Container(
                    height: 270,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.grey.shade100),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Text(
                          "John Doe",
                          style: theme.textTheme.headlineMedium!
                              .copyWith(color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Full time",
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: Colors.black54),
                              ),
                              Text(
                                "Data Manager",
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: Colors.black54),
                              ),
                              Text(
                                "June 2023",
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 30,
                          width: 300,
                          color: Colors.grey.shade700,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Management",
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              const Positioned(
                  top: 130,
                  left: 100,
                  right: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1578489758854-f134a358f08b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTUzfHxwcm9maWxlJTIwcGhvdG98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                    radius: 45,
                  )),
            ],
          )),
    );
  }
}
