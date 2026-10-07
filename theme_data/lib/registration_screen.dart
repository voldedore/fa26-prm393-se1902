import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Registration',
            // style: Theme.of(
            //   context,
            // ).textTheme.headlineLarge?.copyWith(color: colorScheme.primary),
          ),
          FilledButton(
            onPressed: () {
              print(Theme.of(context).textTheme.bodyMedium);
            },
            child: Text('Signup'),
            // style: FilledButton.styleFrom(
            //   // backgroundColor: colorScheme.primary,
            //   // foregroundColor: colorScheme.onPrimary,
            //   backgroundColor: Colors.orangeAccent,
            //   foregroundColor: Colors.grey,
            // ),
          ),
        ],
      ),
    );
  }
}
