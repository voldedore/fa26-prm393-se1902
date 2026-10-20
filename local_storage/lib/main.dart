import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_storage/providers/shared_preferences_provider.dart';
import 'package:local_storage/ui/note_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Đảm bảo app phải được bind.
  WidgetsFlutterBinding.ensureInitialized();

  // lay instance SF (LS) tu he thong
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      // Override lai value cua sharedPreferencesProvider bang instance moi lay duoc phia tren
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NoteListScreen());
  }
}
