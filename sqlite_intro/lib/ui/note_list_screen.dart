import 'package:flutter/material.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Introduction')),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            child: Column(
              children: [
                Text('Note'),
                Text('Content'),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
