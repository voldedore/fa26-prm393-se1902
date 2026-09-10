abstract class Printable {
  void printInfo();
}

mixin Swimmable {
  void swim() {
    print('Swimming');
  }
}

mixin Flyable {
  void fly() {
    print('Flying...');
  }
}

class Animal {
  String name;
  Animal(this.name);
}

class Bird {

}

class Duck extends Animal with Swimmable, Flyable implements Printable {
  int age;
  Duck(String name, this.age) : super(name);

  @override
  void printInfo() {
    print("$name, $age");
  }
}