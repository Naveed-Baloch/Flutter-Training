void main() {
  // variables();
  // nullSafety();
  // lateVariables();
  // finalVsConst();
  wildCardExample();
}

/// variable with type can not be assigned new value
/// but with object we can assign different values
void variables() {
  var number = 1;
  print("Variable number is: $number");
  Object n = 1;
  n = "sdfsd";
  print("Object n is: $n ${n.runtimeType}");
  n = "sd";
  print("Object n is: $n ${n.runtimeType}");
  var variable = "Hello, World!";
  print("Variable is: $variable");
}

// Dart Decide the null safety on compile time
void nullSafety() {
  // Declare a nullable variable
  String? nullableString ;
  nullableString ??= "Not null anymore";
  print(nullableString.toString());
  int? number;
  print(number.toString());
}

/// 1. Lazy initialization when needed
/// 2. Non nullable variable
/// Run Time error is thrown if we don't initialize the variable
void lateVariables() {
  late String readableDistance = calculateDistance();
  // print("The readable distance is: $readableDistance");
  String readableDistance2 = calculateDistance();
}

String calculateDistance() {
  print("Distance calculated");
  return "200 Km from London";
}


/// final is run time constant
/// const is compile time constant
///
/// Const value and final values
void finalVsConst() {
  final date = DateTime.now();
  print(date.year);

  const apiKey = "your_api_key_here";
  print("API_KEY: $apiKey");

  //
  final List<String> finalList = ["Naveed", "Hassan"]; // list values can be changed
  print(finalList);
  finalList[1] = "";
  finalList.add("New Member");
  print(finalList);

  const List<String> finalList2 = ["Final", "List"];
  // finalList2[1] = ""; // this will throw run time error 
}

/// Using _ which are not used 
void wildCardExample() {
  const List<String> wildcardList = ["Wildcard", "Example"];

  for (var _ in wildcardList) {
    print("Loop on list");
  }

  try{
   const list = [];
   list[1] = "";
  }
  // catch(e) {
  //   print("Caught exception:$e ");
  // }

  catch(_) {
    print("Caught exception:");
  }
  finally {
    print("Finally block executed");
  }
}

