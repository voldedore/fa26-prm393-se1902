import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/user.dart';

// Gia su nhu goi xong api se nhan duoc danh sach user
// Hien tai cho 1 mang set cung
const List<User> users = [
  User(id: 1, name: "jon", username: "jon", email: "jon@fpt.vn"),
  User(id: 2, name: "jon2", username: "jon2", email: "jon2@fpt.vn"),
  User(id: 3, name: "jon3", username: "jon3", email: "jon3@fpt.vn"),
  User(id: 4, name: "jon4", username: "jon4", email: "jon4@fpt.vn"),
  User(id: 5, name: "jon5", username: "jon5", email: "jon5@fpt.vn"),
];

// Manually declare a Provider
final userProvider = Provider((ref) {
  return users;
});