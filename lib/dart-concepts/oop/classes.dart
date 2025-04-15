void main() {
  classes();
  Shape shape = Shape(10.0, 20.0);
  print('Shape area: ${shape.area()}');
}

class FrameWork {
  final String name;
  final int version;
  const FrameWork({required this.name, required this.version});

  void printInfo() {
    print('Name: $name, Version: $version');
  }
}

class FrameWorkWithOptional {
  String name;
  int? version;

  FrameWorkWithOptional(this.name, [this.version = 0]);
}

void classes() {
  const FrameWork flutter   = FrameWork(name: 'Flutter', version: 3);
  flutter.printInfo();

  FrameWorkWithOptional frameWorkOptional = FrameWorkWithOptional("React Native");
  print('Name: ${frameWorkOptional.name}, Version: ${frameWorkOptional.version}');
}

class Book {
  String title;
  int pages;
  String author;

  Book({required this.title, required this.pages, required this.author});

  void printBookInfo() {
    print('Title: $title, Pages: $pages, Author: $author');
  }
}

class Shape {
  double length;
  double width;
  Shape(this.length, this.width);

  double area() => length * width;
}
