import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/model/user.dart';

part 'user_provider.g.dart';
// part có nghĩa là code của file này, còn 1 "phần" nữa ở file 'user_provider.g.dart'
// part of có nghĩa là code của file 'user_provider.g.dart' là 1 phần của file 'user_provider.dart'
// Lệnh dart run build_runner build sẽ
// - tìm các annotation để biết cần gen provider nào
// - dựa trên part để gen code ra file nào


// Gia su nhu goi xong api se nhan duoc danh sach user
// Hien tai cho 1 mang set cung
const List<User> users = [
  User(id: 1, name: "jon", username: "jon", email: "jon@fpt.vn"),
  User(id: 2, name: "jon2", username: "jon2", email: "jon2@fpt.vn"),
  User(id: 3, name: "jon3", username: "jon3", email: "jon3@fpt.vn"),
  User(id: 4, name: "jon4", username: "jon4", email: "jon4@fpt.vn"),
  User(id: 5, name: "jon5", username: "jon5", email: "jon5@fpt.vn"),
];

// 1st way: Manually declare a Provider
// final userProvider = Provider((ref) {
//   return users;
// });

// 2nd way: gen code
// Annotation
@riverpod // Đánh dấu cho build runner gen ra cho chúng ta 1 provider gọi là userProvider
List<User> user(ref) { // generator sẽ dựa trên tên của fn này user + Provider = userProvider
  return users; // tạm dùng lại như logic của phần manual
}