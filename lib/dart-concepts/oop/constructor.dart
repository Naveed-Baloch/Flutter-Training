void main() {
  UserWithMultipleConstructors.initOldUsers("USSF", "Naveed").printUserDetails();
  Laptop laptop = Laptop(id: "L1", brand: "Dell");
  print(laptop.toJson());

  Car car = Car.simple("City", "Space black");
  print(car.name);
  print(car.color);

}

/// Generative Constructor
class User{
  String id;
  String name;

  User({required this.id, required this.name});
}

/// Named Constructor
/// Multiple Constructor using same name using NamedConstr
class UserWithMultipleConstructors {
  String id;
  String name;

  UserWithMultipleConstructors({required this.id, required this.name});

  // Additional named constructor
  UserWithMultipleConstructors.fromJson(Map<String, dynamic> json)
      :id = json['id'], name = json["name"];

  UserWithMultipleConstructors.usingData() :id = '', name = '';

  UserWithMultipleConstructors.initOldUsers(this.id, this.name);

  void printUserDetails() {
    print('ID: $id, Name: $name');
  }
}

class Laptop {
  String id;
  String brand;

  Laptop({required this.id, required this.brand});

  Laptop.fromJson(Map<String, dynamic> json)
      : id = json['id'], brand = json['brand'];

  // Add toJson method
  Map<String, dynamic> toJson() => {
    'id': id,
    'brand': brand,
  };
}

class Car {
  String name;
  String color;
  double? price;
  
  Car({required this.name, required this.color, this.price});

  Car.simple(this.name, this.color);
}


/// Factory Constructor: Are used for the Controlled Constructor creation.
/// We can return the Controller and cached data as well