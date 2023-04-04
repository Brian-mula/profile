import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "p",
                  style: theme.textTheme.headlineLarge!
                      .copyWith(color: Colors.orange.shade600, fontSize: 55),
                ),
                Text(
                  "ayroll",
                  style: theme.textTheme.headlineLarge!
                      .copyWith(color: Colors.black87, fontSize: 55),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Create a new account",
              style: theme.textTheme.headlineLarge!
                  .copyWith(color: Colors.black87),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Please enter your credentials to continue to the app",
              style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black87),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                  color: Colors.orange.shade600, width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                  color: Colors.orange.shade800, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Colors.orange.shade600, width: 1.0))),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
