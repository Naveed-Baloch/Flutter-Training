class Cooler {
  String? _name;
  int? _price;

  set name(String? value) => _name = value;

  set name1(String? value) {
    if (value != null && value.isNotEmpty) {
      _name = value;
    } else {
      throw ArgumentError("Name cannot be empty");
    }
  }
  set price(int? value) => _price = value;

  String? get name => _name;
  int? get price => _price;


  void printDetails() {
    print("Name: $_name");
    print("Price: $_price");
  }
}

void main() {
  Cooler cooler = Cooler();
  cooler._name = "My Cooler";
}