abstract class Printable {
  void printInfo();
}

mixin Swimmable {
  void swim() {
    print('Swimming');
  }

  void prepare() {
    print('Preparing swimming');
    // swim();
  }
}

mixin Flyable {
  void fly() {
    print('Flying...');
  }
  void prepare() {
    print('Preparing flying');
  }
}

class Animal {
  String name;
  Animal(this.name);
}

class Bird {

}

class Duck extends Animal with Flyable, Swimmable implements Printable {
  int age;
  Duck(String name, this.age) : super(name);

  @override
  void printInfo() {
    print("$name, $age");
  }
}