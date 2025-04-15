

/// Dart Supports Single inheritence
/// A Class can be inherited from single class only
class App {
  String name;
  String version;

  App({
    required this.name,
    required this.version,
  });

  void printAppDetails() {
    print('App Name: $name');
    print('App Version: $version');
  }
}

class Whatsapp extends App {
  String logo;

  Whatsapp({required this.logo, required super.name, required super.version});

  void logoDetails() {
    print('Logo: $logo');
  }
}

void main() {
  Whatsapp whatsapp = Whatsapp(
    name: 'Whatsapp',
    version: '2.22.17.76',
    logo: 'Green Circle with White Phone',
  );
  whatsapp.printAppDetails();
  whatsapp.logoDetails();
}