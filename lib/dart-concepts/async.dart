// void main() {
//   asyncFunction().then((value) => print(value));
// }

enum Status { Loading, Completed, Error }

Future<Status> asyncFunction() async {
  print("First Operation");
  await Future.delayed(
    Duration(seconds: 3),
    () => print('Second Big Operation'),
  );
  print("Third Operation");
  print("Last Operation");
  return Status.Completed;
}

void main() async {
  // print("Start");
  // await getData();
  // print("End");
  //

  await asyncErrorHandlingExample()
      .then(
        (value) {
          print("Operation completed");
        },
        onError: (e) {
          print("Error caught in onError");
          throw Exception("Error in then");
        },
      )
      .catchError((e) => print("Caught: $e in catchError"))
      .whenComplete(() => print("When Complete"));
}

Future<void> getData() async {
  String data = await middleFunction();
  print(data);
}

Future<String> middleFunction() {
  return Future.delayed(Duration(seconds: 5), () => "Hello");
}

Future<void> asyncErrorHandlingExample() async {
  print("First Operation");
  await Future.delayed(
    Duration(seconds: 2),
    () => throw Exception("Error in second operation"),
  );
}
