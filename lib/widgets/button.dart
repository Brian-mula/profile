import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Button extends ConsumerStatefulWidget {
  const Button({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonState();
}

class _ButtonState extends ConsumerState<Button> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
