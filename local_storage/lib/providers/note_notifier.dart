
import 'dart:convert';

import 'package:local_storage/model/note.dart';
import 'package:local_storage/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_notifier.g.dart';

@riverpod
class NoteNotifier extends _$NoteNotifier {
  // Key de luu gia tri vao local storage
  static const String _notesKey = 'notes';

  // Init state provider
  @override
  List<Note> build() {
    return _loadNotes();
  }
  // CRUD
  // Đọc vào SF -> get String List -> jsonDecode -> Note.fromJson
  List<Note> _loadNotes() {
    // sharedPreferencesProvider
    final prefs = ref.read(sharedPreferencesProvider);
    final notesJson = prefs.getStringList(_notesKey) ?? [];
    final notes = notesJson.map((noteString) => Note.fromJson(jsonDecode(noteString))).toList();
    state = notes;
    return notes;
  }

  void addNote(String title, String content) async {
    // Tao 1 object note moi
    final newNote = Note(DateTime.now().millisecondsSinceEpoch, title, content);

    // Them note vua tao vao state
    // state.add(newNote); // Ko dung
    state = [...state, newNote];

    // Thuc hien luu tru vao shared prefs
    await _saveNotes();
  }

  Future<void> _saveNotes() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final noteStringList = state.map((note) => jsonEncode(note.toJson())).toList();
    await prefs.setStringList(_notesKey, noteStringList);
  }

  void deleteNote(int id) {
    // State -> List<Note> -> getById -> tạo state [] mới bỏ note tìm thấy ra
    // Ghi lại state vào trong SF
  }

  void editNote(Note newNote) {
    // state -> List<Note> -> getById -> edit note tim thay
    // -> tạo state [] mới
    // Ghi lại state vào trong SF

  }

}