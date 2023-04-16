import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/providers/auth_providers.dart';
import 'package:payroll/views/auth/login.dart';
import 'package:payroll/views/home/homepage.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.read(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) return const HomePage();
          return const LoginView();
        },
        error: (e, trace) => Center(
              child: Text(e.toString()),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
