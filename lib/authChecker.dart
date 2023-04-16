import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/providers/auth_providers.dart';
import 'package:payroll/views/auth/login.dart';
import 'package:payroll/views/home/homepage.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data == null) {
            return const LoginView();
          } else {
            return const HomePage();
          }
        },
        error: (e, trace) => Center(
              child: Text(e.toString()),
            ),
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
