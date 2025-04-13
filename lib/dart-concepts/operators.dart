
void main() {
  // conditionOperators(); // ? :
  // cascadeNotation(); //.. ?..
  spreadOperators(); //...
}


void conditionOperators() {
  /// ? and :
  final dob = DateTime(2000);
  bool is18YearsOld = DateTime.now().difference(dob).inDays >= 18 * 365;
  print(is18YearsOld ? "Valid" : "Invalid");

  /// ?? null check
  /// null-coalescing
  var name;
  try {
    String fullName = name ?? "Unknow";
    print(fullName.toString());
  } catch(e) {
    print("Error: $e");
  }
}

/// .. and ?..
/// .. is used to apply the operations on object with out getting the instance
void cascadeNotation() {
  var student = Student("John Doe", 20);
  student.printDetails();
  // Update Object
  student
    ..age = 21
    ..name = "New Name ";
  student.printDetails();

  /// null-shorting cascade ?..
  late Student? student2;
  student2 = Student("Naveed", 25);
  student2.printDetails();

  student2
  ?..age = 0
  ..name = "";
  student2?.printDetails();
}

class Student {
  String name;
  int age;

  Student(this.name, this.age);

  void printDetails() {
    print("Student Name: $name, Age: $age");
  }
}

/// ... Spread operators
void spreadOperators() {
  const list1 = [1, 2, 3];
  const list2 = [...list1, 4, 5, 6, ...list1];
  print(list2);
}
