mixin Printable {
  void printInfo(String label, dynamic value) {
    print('$label: $value');
  }
}

class Student with Printable {
  final String name;
  final int englishGrade;
  final int arabicGrade;

  Student({
    required this.name,
    required this.englishGrade,
    required this.arabicGrade,
  });

  void getStudentDetails() {
    printInfo('Name', name);
    printInfo('English Grade', englishGrade);
    printInfo('Arabic Grade', arabicGrade);
  }
}

void main() {
  final Student s1 = Student(
    name: 'Mohamed',
    englishGrade: 100,
    arabicGrade: 90,
  );

  s1.getStudentDetails();
}
