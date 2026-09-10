import 'package:hello_world/animal.dart';

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

void main() {
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
  Student s1 = Student("SE123456", "Jon", 1);
  s1.gender = -1;
  s1.displayInfo();

  Student s2 = Student.withGender(1);
  s2.displayInfo();

  Duck d1 = Duck("Donald", 2);
  d1.printInfo();
  d1.swim();
  d1.fly();
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
