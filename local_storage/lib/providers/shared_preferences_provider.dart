import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_provider.g.dart';

// Khai báo thêm 1 provider mới (sharedPreferencesProvider)
// Chịu trách nhiệm cung cấp 1 instance Share Preferences (LocalStorage) cho toàn app.
@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  // chủ động throw Exception do provider này sẽ được override lại giá trị
  // từ hàm main() (binding -> lấy instance SF -> override values)
  throw UnimplementedError();
}