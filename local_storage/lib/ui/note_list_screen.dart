import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_storage/providers/note_notifier.dart';

class NoteListScreen extends ConsumerStatefulWidget {
  const NoteListScreen({super.key});

  @override
  ConsumerState<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends ConsumerState<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(noteProvider);

    // ref.watch(noteProvider) // theo doi su thay doi cua state (noteProvider)
    // ref.read(noteProvider) // chi doc lan dau state
    // ref.read(noteProvider.notifier) // lay object notifier (call CRUD methods)

    return Scaffold(
      appBar: AppBar(title: Text('Note Management App')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // handle addNote
          ref.read(noteProvider.notifier).addNote('Note 1', 'This is the content');
        },
        child: Icon(Icons.add),
      ),
      body: // GridView,
      GridView.count(
        crossAxisCount: 2,
        children: notes
            .map((note) => Card(
              child: Column(
                  children: [
                    Text(note.title),
                    Text(note.content),
                    IconButton(onPressed: () {
                      // goi note notifier de delete note
                      ref.read(noteProvider.notifier).deleteNote(note.id);
                    }, icon: Icon(Icons.delete))
                  ]
                )
              )
            ).toList(),
      ),
    );
  }
}
