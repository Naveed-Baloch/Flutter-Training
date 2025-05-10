void main() {
  // record();
  // list();
  // set();
  maps();
}

/// Records are heterogeneous
/// Its like Pair or tipple with any type but we can nest them as well
void record() {
  const record = (first: (name: "Naveed", marks: 900), second: (name: "Ali", marks: 800));
  print(record.first);
  print(record.second);

  // record with Type
  (String, int) person;
  person = ("Naveed", 900);
  print(person);
}

/// Lists
void list() {
  var list = [1, 2, 3];
  var names = ["Naveed", "Ali", "Ahmed", "Zeeshan"];
  print(names);
  names.sort((a, b) => b.compareTo(a));
  print(names);
  names.sort();
  print(names);
}

/// Sets
/// Collections of Unique values
void set() {
  var names = {"Naveed", "Ali", "Ahmed", "Zeeshan", "Ali"};
  print(names);
}

/// Maps
void maps() {
  var marks = {
    "Naveed": 900,
    "Ali": 800,
    "Ahmed": 700,
    "Zeeshan": 600
  };
  marks.forEach((key, value) {
    print("$key : $value");
  });
}