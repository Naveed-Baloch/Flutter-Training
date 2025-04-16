

void main() {
  MacBook macbook = MacBook("MacBook Pro");
  macbook.details();
}

class Laptop {
  String name;
  Laptop(this.name);

  void details() {
    print("Laptop name: $name");
  }
}

class MacBook extends Laptop {
  MacBook(super.name);

  @override
  void details() {
    print("MacBook name: $name");
  }
}