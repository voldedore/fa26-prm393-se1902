import 'dart:convert';
import 'dart:math';
import 'package:hello_world/animal.dart';
import 'package:http/http.dart' as http;

import 'Post.dart';

void greet() {
  print("Hi. It's sunny today");
  print('Hi. It\'s sunny today');
}
// int? age -> age co the null
void greet2(String name, [int? age, int? gender]) {
  print('Hello $name, you are $age');
}
void greet3(String name, [int age = 18]) { // [] -> optional
  print('Hi $name, you are $age');
}
void greet4({String name = "Jon", int age = 18}) { // named param
  print('Hi $name, you are $age');
}
void greet5({required String name, int age = 20}) {
  print('Hi $name, you are $age');

}

// void main() {
//   greet5(name: "Mark");


// void main() {
//   // String name = "Jon";
//   // print("Length: ${name.length}");
//   // greet();
//   // greet2("Alice", 20);
//   // greet2("Mark", null);
//   // greet2("Bob", 2);
//   // greet3("Julie");
//   greet4();
//   greet4(name: "jon");
//   greet4(age: 16, name: "Alice");
//   greet4(age: 40);
// }

// 1) Viết hàm void describe()
// Nhận 2 tham số String color, String size
// Logic:
// - describe(size: 'large')
//    => In ra 'This item is blue and large
// - describe(size: 'small', color: 'red')
//    => In ra 'This item is red and small
// - describe(color: 'red')
//    => In ra 'This item is red and medium
// - describe()
//    => In ra 'This item is blue and medium
void describe({String color = "blue", String size = "medium"}) {
  print("this item is $color and $size");
}
// void main(){
//   describe(size: 'large');
//   describe(size: 'small', color: 'red');
//   describe(color: 'red');
//   describe();
// }

// 2) Viết hàm String fullName
// Nhận vào 3 tham số: firstName, middleName, lastName (string)
// return:
// - fullName('John') => John
// - fullName('John', 'Mark', 'Zuck') => John Mark Zuck
// - fullName('John', 'Zuck') => John Zuck

// String fullname(String firstName?, [String?middleName="",String?lastName=""])
// {
// return "$firstName $middleName $lastName"; }
//
// void main() {
//   print (fullname("John"));
//   print (fullname("John", "Mark", "zuck"));
//   print (fullname("john", "Mark"));
// }

int add(int a, int b) {
  return a + b;
}

int add2(int a, int b) => a + b;

String generateMsg() => "Hi";

void printMsg() => print(generateMsg());

void main() async {
  // print('5 + 7 = ${add(5, 7)}');
  // print('10 + 20 = ${add2(10, 20)}');
  // print('Line 89 ${generateMsg()}');
  // print('Line 90');
  // printMsg();

  // var base = [4, 7, 10];
  // print(base);
  // int age = 18;
  // var list = [...base, if (age > 16) 1, for (var x in base) x * 2]; // spread operator
  // print(list);
  //
  // var scores = [5, 8, 3, 9, 6];
  // var one = scores.where((x) => {x >= 6}).toList();
  // var two = scores.map((x) => {x + 2}).toList();
  // print(one);
  // print(two);
  // Student s1 = Student("SE123456", "Jon", 1);
  // s1.gender = -1;
  // s1.displayInfo();
  //
  // Student s2 = Student.withGender(1);
  // s2.displayInfo();
  //
  // Duck d1 = Duck("Donald", 2);
  // d1.printInfo();
  // d1.swim();
  // d1.fly();
  // d1.prepare();

  // --------------- FUTURE
  // print("120");
  // Future(() => 1)
  //     .then((v) => v + 1)
  //     .then((value) => print(value));
  // Future(getOne)
  //     .then(addOne)
  //     .then(printIntValue);
  // print("124");
  //
  // var u = await fetchUser();
  // print('Hello $u');
  // ------------- STREAM
  // numbers().listen((v) => print(v * 3));
  // luckyNumber().forEach((v) => print(v));

  var p = await fetchPost(3);
  print(p.toString());
}
// Bai tap
// viet fn fetchPost(int id)
// Dung http va async de call API
// GET https://jsonplaceholder.typicode.com/posts/{id}
// return 1 object post
// Co the phai chinh lai class Post 1 chut xiu
// Ham main: goi fetchPost(3) ket qua (thong tin cua bai post id 3) ra man hinh

Future<Post> fetchPost(int id) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
  final response = await http.get(url);
  // print(response.statusCode);
  // print(response.body);
  return Post.fromJson(jsonDecode(response.body));
}


// Hint: cach de lay 1 so ngau nhien
// Random()     nextInt....
// Viet 1 mini program de xo so
// Moi 0.5 giay in ra 1 so ngau nhien tu 0-100
// Neu xo ra so 79, dung chuong trinh va in ra thong bao "Grats"
Stream<int> luckyNumber() async* {
  while (true) {
    await Future.delayed(const Duration(milliseconds: 500));
    int n = Random().nextInt(100);
    yield n;

    if (n == 79) {
      print("Grats");
      break;
    }
  }
}



// Bai tap 2
// Cho URL https://jsonplaceholder.typicode.com/users
// Viết class User (id, name, email, phone, grade)
// Viết 1 đoạn code để fetch User mỗi 2 giây.
// Random số điểm của SV và in ra màn hình.


int getOne() {
  return 1;
}
int addOne(int v) {
  return v + 1;
}
void printIntValue(int v) {
  print(v);
}

Future<String> fetchUser() {
  return Future.delayed(const Duration(seconds: 2), () => "Jon");
}

Stream<int> numbers() async* {
  yield 5;
  yield 10;
  yield 77;
}



class Student {
  String id;
  String name;
  int _gender;

  // Constructor theo truyen thong
  // Student(String id, String name, int gender) {
  //   this.id = id;
  //   this.name = name;
  //   this.gender = gender;
  // }

  // Dart style
  Student(this.id, this.name, this._gender);
  // named constructor
  // Phia sau dau : la initial value cho tt
  Student.withGender(this._gender) : id = '', name = '';

  // getter
  int get gender => _gender;

  // setter
  set gender(int gender) {
    if (gender > 1 || gender < 0) {
      this._gender = 0;
    } else {
      this._gender = gender;
    }
  }

  void displayInfo() {
    print('Student id=$id, name=$name, gender=$_gender');
  }
}
