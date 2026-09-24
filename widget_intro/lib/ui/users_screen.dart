import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widget_intro/model/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users list'),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body: Column(
          children: [
            Text('Users screen'),
            ElevatedButton(
              onPressed: () {
                // try {
                  Future<void> getUsers() async {
                    final response = await http.get(
                      Uri.parse('https://jsonplaceholder.typicode.com/users'),
                    );
                    if (response.statusCode == 200) {
                      final List<dynamic> data = jsonDecode(response.body);

                      setState(() {
                        users = data.map((json) {
                          return User.fromJson(json);
                        }).toList();
                      });
                    }
                  }
                // } catch
              },
              child: Text('Fetch users'),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'GridView',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'ListView',
            ),
          ],
        ),
      ),
    );
  }
}

