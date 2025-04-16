void main() {
  // sum(10, 20);
  // sumForDouble(10.5, 20.5);
  sumGeneric(10, 20);
  sumGeneric(10.5, 20.5);
}

void sum(int a, int b){
  int sum = a + b;
  print("Sum is $sum");
}

void sumForDouble(double a, double b){
  double sum = a + b;
  print("Sum is $sum");
}

void sumGeneric<T extends num>(T a, T b) {
  var sum = a + b;
  print("Sum is $sum");
}

