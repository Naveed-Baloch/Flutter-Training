import 'package:flutter_training/dart-concepts/oop/encapsulation-data.dart';

/// Every .dart file is a library which helps in encapsulation
void main() {
  Cooler cooler = Cooler();
  cooler.name = "hair dryer";
  cooler.name1 = "Supper Asia";
  cooler.price = 100;
  print(cooler.name);
  print(cooler.price);
}

