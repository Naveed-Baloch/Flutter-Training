/// Functions are like objects which can be passed as params to functions as well



void main() {
  print(isEven(45));
  print(isOdd(45));
  printUserDetails(name: "Naveed", age: 12);
  printLaptopDetails("Apple");
}


bool isEven(int number) {
  return number % 2 == 0;
}

bool isOdd(int number) => number %2 != 0;


/// Named Arguments with required & default values
void printUserDetails({required String name, required int age}) {
  print('Name: $name');
  print('Age: $age');
}


/// Optional Params

void printLaptopDetails(String? brand, [int? year = 2022]) {
  print('Brand: $brand');
  print('Year: $year');
}
