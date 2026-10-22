import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite_intro/model/note.dart';
import 'package:sqlite_intro/providers/note_notifier.dart';

class NoteListScreen extends ConsumerStatefulWidget {
  const NoteListScreen({super.key});

  @override
  ConsumerState<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends ConsumerState<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    final notesAsyncVal = ref.watch(noteProvider);
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Introduction')),
      body: notesAsyncVal.when(
        data: (notes) => notes.isEmpty
            ? Text('No notes. Please create one.')
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Card(
                    child: Column(
                      children: [Text(note.title), Text(note.content)],
                    ),
                  );
                },
              ),
        error: (err, stack) => Text('There is an error loading notes'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // goi notifier
          ref
              .read(noteProvider.notifier)
              .addNote(
                Note(title: 'Note title', content: 'This is the content'),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
