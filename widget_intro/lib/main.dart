import 'package:flutter/material.dart';
import 'package:widget_intro/ui/home_screen.dart';
import 'package:widget_intro/ui/login_screen.dart';
import 'package:widget_intro/ui/screen_one.dart';
import 'package:widget_intro/ui/settings_screen.dart';
import 'package:widget_intro/ui/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Hello SE1902'),
      initialRoute: '/',
      routes: {
        '/users_screen': (context) => UsersScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Danh sach cac screen
  final List<Widget> screens = [];
  int _currentNavBarIndex = 0;

  @override
  void initState() {
    super.initState();
    screens.add(ScreenOne());
    screens.add(HomeScreen());
    screens.add(LoginScreen());
    screens.add(SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: screens[_currentNavBarIndex], // ScreenOne ? HomeScreen ? LoginScreen? Settings?
      bottomNavigationBar: BottomNavigationBar(
        // type: .fixed,
        type: BottomNavigationBarType.fixed,
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Input'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Login'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (v) {
          setState(() {
            _currentNavBarIndex = v;
          });
        },
        currentIndex: _currentNavBarIndex,
      ),
    );
  }
}
