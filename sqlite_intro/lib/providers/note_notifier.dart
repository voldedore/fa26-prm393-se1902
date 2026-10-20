
import 'dart:convert';

import 'package:local_storage/model/note.dart';
import 'package:local_storage/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_notifier.g.dart';


@riverpod
class NoteNotifier extends _$NoteNotifier {
  // Khai báo 1 key để lưu data vào shared preferences
  static const String _noteKey = 'notes';

  // Quy trình khởi tạo app (init noteProvider -> gọi build() để init state ban đầu)
  // Đọc vào SharedPreferences -> JSON (StringList) thành List<Note> -> return về build
  @override
  List<Note> build() {
    return _loadNotes();
  }

  // CRUD
  // List
  List<Note> _loadNotes() {
    // Gọi provider của shared preferences để lấy instance SF
    final prefs = ref.read(sharedPreferencesProvider);
    // Dựa trên key để đọc data (String List jsons)
    final notesJson = prefs.getStringList(_noteKey) ?? [];
    return notesJson.map((str) => Note.fromJson(jsonDecode(str))).toList();
  }

  // P/thức để lưu state hiện tại vào SharedPreferences
  Future<void> _saveNotes() async {
    // Gọi instance SF
    final prefs = ref.read(sharedPreferencesProvider);
    // Lấy state hiện tại (List<Note>) chuyển về mảng JSON
    final notesJson = state.map((note) => jsonEncode(note.toJson())).toList();
    // Thực hiện ghi vào SF
    await prefs.setStringList(_noteKey, notesJson);
  }

  // P/thức thêm 1 Note mới vào state của noteProvider
  Future<void> addNote(String title, String content) async {
    // Khai báo một đối tượng Note mới
    final newNote = Note(
        DateTime.now().millisecondsSinceEpoch,
        title,
        content
    );
    // Cập nhật lại state của provider (noteProvider)
    // state.add(newNote); // Mặc dù đúng về cú pháp, nhưng không hoạt động
    state = [...state, newNote];
    // Persist (lưu trữ)
    await _saveNotes();
  }

  // Update

  // Delete
  Future<void> delete(int id) async {
    // state -> tìm trong state, tất cả note mà khác id input, gom về List<Note> mới
    // VD state = [2, 7, 10], idInput=7 -> state = [2, 10]
    state = state.where((n) => n.id != id).toList();
    // persist vao SP
    await _saveNotes();
  }
}