import 'package:flutter/material.dart';
import 'package:theme_data/registration_screen.dart';

import 'app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MaterialApp(
      title: 'Theme Data',
      theme: AppTheme.create(.light), // sinh ra 1 object ThemeData theo brightness
      // theme: Theme.of(context).copyWith(
      //   textTheme: TextTheme(
      //     bodyMedium: TextStyle(fontSize: 50)
      //   )
      // ),
      darkTheme: AppTheme.create(.dark),
      themeMode: ThemeMode.light, // chỉ định mode của theme (sáng/tối/theo device)
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Theme Data',
            // style: TextStyle(
            //   fontSize: 36,
            //   fontWeight: .bold,
            //   // color: colorScheme.primaryContainer,
            //   color: Colors.teal,
            // ),
          ),
        ),
        body: Center(
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
        ),
        // Thực hiện xây dựng Drawer gồm:
        // 1. Selectbox (Theme: ...) cung cấp 3 màu: Pink, Teal, Orange làm chủ đề cho App
        // 2. Switch (Dark mode: ...) cho phép user bật tắt mode
        // 3. Handle hiển thị image làm banner
        drawer: Drawer(),
      ),
    );
  }
}
