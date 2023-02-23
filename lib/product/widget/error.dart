import 'package:flutter/material.dart';

class ErrorApi extends StatelessWidget {
  const ErrorApi({
    super.key,
    this.onRety,
  });

  final VoidCallback? onRety;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Problem loading products'),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: onRety,
          child: const Text('Try again'),
        ),
      ],
    );
  }
}
