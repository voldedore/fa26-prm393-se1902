import 'package:flutter/material.dart';

import 'users_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Bai tap:
  // (1) Viet them 1 screen Login va xu ly BottomNavigationBar de chuyen screen
  // (2) UI:  TextField cho username
  //      TextField cho password
  //      Button Login
  // (3)     Khi user nhap 'admin' & '123456'
  //      Xu ly su kien:
  //      Neu dung mo 1 thong bao (Snackbar) dang nhap thanh cong
  //      Neu sai thi mo 1 thong bao dang nhap that bai
  // (4)     Bonus:
  //      Validation:
  //      - username phai co it nhat 3 ky tu
  //      - pwd phai co it nhat 6 ky tu
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Routes

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Login', style: Theme.of(context).textTheme.headlineMedium),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(label: Text('Username')),
                    onChanged: (v) {},
                    controller: usernameController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text('Password')),
                    onChanged: (v) {},
                    obscureText: true,
                    controller: passwordController,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('btn pressed');
                      print(usernameController.text);
                      print(passwordController.text);
                      if (formKey.currentState!.validate()) {
                        print('valid');
                        // Snackbar
                        // Tam thoi cho username admin password 123456
                        if (usernameController.text == 'admin' &&
                            passwordController.text == '123456') {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Success')));
                          // Navigator
                          // Navigator.of(context).push(MaterialPageRoute(builder: (v) => const UsersScreen()));
                          // 1. Navigator.push(context, route)
                          // 2. Navigator.pushReplacement(context, newRoute)
                          // 3. Navigator.pushAndRemoveUntil(context, newRoute, predicate)
                          // 4,5,6. Push named (tương tự, chỉ khác là ta phải khai báo tên các routes ở MaterialApp())
                          Navigator.pushReplacementNamed(context, '/users_screen');


                          // 1) Chuyển màn hình qua 1 Scaffold
                          // 2) Trong Scaffold có Nav 2 menu: Grid, List
                          // 3) Trong màn hình Grid
                          // Có 1 button
                          // 4) Viết lớp User: Thông tin User (id, name, username, email)
                          // 5) Khi tap vào button đó, call API https://jsonplaceholder.typicode.com/users
                          // Lấy tất cả users nhận được từ API và hiển thị vào 1 GridView
                          // Grid view có 3 cột, mỗi user được hiển thị trong 1 widget Card
                          // "name [id]"
                          // @username
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login failed'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } else {
                        print('invalid');
                      }
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
