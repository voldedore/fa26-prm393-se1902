import 'package:flutter/material.dart';

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
            Text('Login', style: Theme.of(context).textTheme.headlineMedium,),
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
                  ElevatedButton(onPressed: () {
                    print('btn pressed');
                    print(usernameController.text);
                    print(passwordController.text);
                    if (formKey.currentState!.validate()) {
                      print('valid');
                    } else {
                      print('invalid');
                    }
                  }, child: Text('Login'))
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
