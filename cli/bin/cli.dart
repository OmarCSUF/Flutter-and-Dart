import 'dart:io';

class Student {
  String name;
  List<Class> classes = [];

  Student(this.name);

  void addClass(Class newClass) {
    classes.add(newClass);
  }

  void calculateFinalGrades() {
    print('Final Grades for $name:');
    for (var classItem in classes) {
      print('${classItem.name}: ${classItem.calculateFinalGrade()}');
    }
  }
}

class Class {
  String name;
  double firstMidterm;
  double secondMidterm;
  double finalGrade;

  Class(this.name, this.firstMidterm, this.secondMidterm, this.finalGrade);

  String calculateFinalGrade() {
    double average = (firstMidterm + secondMidterm + finalGrade);
    if (average >= 90) {
      return 'A';
    } else if (average >= 80) {
      return 'B';
    } else if (average >= 70) {
      return 'C';
    } else if (average >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }
}

void main(List<String> arguments) {
  print('Enter student\'s name:');
  String studentName = stdin.readLineSync()!;

  var student = Student(studentName);

  for (var i = 0; i < 3; i++) {
    print('Enter class ${i + 1} name:');
    String className = stdin.readLineSync()!;

    print('Enter $className\'s 1st midterm grade:');
    double firstMidterm = double.parse(stdin.readLineSync()!);

    print('Enter $className\'s 2nd midterm grade:');
    double secondMidterm = double.parse(stdin.readLineSync()!);

    print('Enter $className\'s final grade:');
    double finalGrade = double.parse(stdin.readLineSync()!);

    var newClass = Class(className, firstMidterm, secondMidterm, finalGrade);
    student.addClass(newClass);
  }

  student.calculateFinalGrades();
}
