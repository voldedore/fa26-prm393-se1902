import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite_intro/db/database_helper.dart';
import '../model/note.dart';

part 'note_notifier.g.dart';

@riverpod
class NoteNotifier extends _$NoteNotifier {

  @override
  Future<List<Note>> build() {
    return DatabaseHelper.instance.getAll();
  }
  // crud state
  Future<void> addNote(Note note) async {
    // persist
    await DatabaseHelper.instance.create(note);

    // state
    ref.invalidateSelf(); // báo hiệu build() cần được chạy lại
    await future;         // chờ state mới load xong
  }
}