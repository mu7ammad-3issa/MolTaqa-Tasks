class Person {
  final String name;
  final int age;
  final String email;

  const Person(this.name, this.age, this.email);

  void showInfo() {
    print('Name: $name');
    print('Age: $age');
    print('Email: $email');
  }
}

void main() {
  final person = Person('Mohamed Issa', 22, 'mu7ammad.3issa@gmail.com');
  person.showInfo();
}
