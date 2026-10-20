import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/ui/note_list_screen.dart';

void main() {
  // Ensure binding
  WidgetsFlutterBinding.ensureInitialized();
  // Provider scope
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteListScreen(),
    );
  }
}


