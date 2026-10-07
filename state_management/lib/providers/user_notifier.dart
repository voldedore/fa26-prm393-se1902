import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/model/user.dart';



// 1st way: MANUAL
// class UserNotifier extends Notifier<List<User>> {
//   // p/thức build sẽ trả về kiểu dữ liệu chính của state mà provider đang QL
//   @override
//   List<User> build() {
//     return [];
//   }
//   // chúng ta có thể viết thêm các p/thức để cập nhật lại state
//   void fetchUsers() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//     if (response.statusCode == 200) {
//       List<dynamic> json = jsonDecode(response.body);
//       List<User> users = json.map((j) {
//         return User.fromJson(j);
//       }).toList();
//       state = users; // cap nhat lai state cua Notifier
//       // state.add(u) // tai sao không xử lý theo hướng này
//     }
//   }
//   void clearUsers() {
//     state = [];
//   }
// }
// final userNotifierProvider = NotifierProvider<UserNotifier, List<User>>(() {
//   return UserNotifier();
// });

// 2nd way: gen code
part 'user_notifier.g.dart';
@riverpod
class UserNotifier extends _$UserNotifier {
  // _$UserNotifier là viết tắt của NotifierProvider...
  // Naming convention
  // Lấy tên class          UserNotifier
  // Bỏ suffix Notifier     User
  // Thêm suffix Provider   UserProvider
  @override
  List<User> build() {
    return [];
  }
  // chúng ta có thể viết thêm các p/thức để cập nhật lại state
  void fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      List<User> users = json.map((j) {
        return User.fromJson(j);
      }).toList();
      state = users; // cap nhat lai state cua Notifier
      // state.add(u) // tai sao không xử lý theo hướng này
    }
  }
  void clearUsers() {
    state = [];
    // state.clear();
  }

  int count() {

  }
}

// Dependent provider
@riverpod
int totalUsers(ref) {
  final users = ref.watch(userProvider);
  return users.length;
}