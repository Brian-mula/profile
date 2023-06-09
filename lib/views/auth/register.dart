import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:payroll/providers/auth_providers.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    ThemeData theme = Theme.of(context);

    final auth = ref.watch(authProvider);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
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
                style:
                    theme.textTheme.bodyLarge!.copyWith(color: Colors.black87),
              ),
              const SizedBox(
                height: 100,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.orange.shade600,
                        controller: usernameController,
                        keyboardType: TextInputType.name,
                        decoration: fieldDecoration("Username"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter the username";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        cursorColor: Colors.orange.shade600,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: fieldDecoration("Email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter the email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        cursorColor: Colors.orange.shade600,
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration:
                            fieldDecoration("Password", Icons.remove_red_eye),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.orange.shade700),
                                elevation: const MaterialStatePropertyAll(0.0)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Processing data")));

                                await auth.signupWithEmail(
                                    emailController.text,
                                    passwordController.text,
                                    usernameController.text,
                                    context);
                                // if (auth.nexpage) {
                                //   Navigator.pushNamed(context, '/');
                                // }
                              }
                            },
                            child: Text(
                              "Register",
                              style: theme.textTheme.headlineMedium!
                                  .copyWith(color: Colors.white),
                            )),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account ? ",
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Sign in ",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.orange.shade600),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.black26,
                    width: 150,
                    height: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 7, right: 7),
                    child: Text("or sign in with"),
                  ),
                  Container(
                    color: Colors.black26,
                    width: 150,
                    height: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160,
                    child: SignInButton(
                      Buttons.Google,
                      text: " Google",
                      onPressed: () async {
                        await auth.signinWithGoogle(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: SignInButton(
                      Buttons.Facebook,
                      text: " Facebook",
                      onPressed: () {},
                    ),
                  )
                ],
              )
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
