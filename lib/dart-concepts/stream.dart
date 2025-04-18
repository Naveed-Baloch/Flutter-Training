import 'dart:async';

/// Stream<T>
/// Yield -> emits the value
/// stream().listen or await for (var e in stream) can be used for the getting the value from it.
void main() async {
  // var result = Result.Loading;
  // result = await fetchData();
  // print(result);

  // print("Fetching Data");
  // fetchDataUsingStream().listen((event) {
  //   print(event);
  // });
  // fetchDataUsingStream().listen(printEvent);
  // print("Fetching Data Completed");
  //
  // await for (var event in fetchDataUsingStream()) {
  //   print(event);
  // }
  //
  // fetchDataUsingStream2().listen((time) {
  //   print(time);
  // });
  streamController();
}

void printEvent(Result event) {
  print(event);
}

enum Result { loading, success, failure }

Future<Result> fetchData() async {
  var result = Result.loading;
  print(result);
  try {
    await Future.delayed(Duration(seconds: 2));
    // throw Exception("Something went wrong");
    result = Result.success;
  } catch (e) {
    result = Result.failure;
  }
  return result;
}

Stream<Result> fetchDataUsingStream() async* {
  yield Result.loading;
  try {
    await Future.delayed(Duration(seconds: 2));
    // throw Exception("Something went wrong");
    yield Result.success;
  } catch (e) {
    yield Result.failure;
  }
}

Stream<String> fetchDataUsingStream2() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield DateTime.now().toIso8601String();
  }
}

void streamController() async{
  var controller = StreamController<Result>();

  controller.stream.distinct().listen(
    (event) {
      print(event);
    },
    onDone: () {
      print("Done");
    },
    onError: (error) {
      print(error);
    },
  );

  while(true) {
    await Future.delayed(Duration(seconds: 1));
    controller.add(Result.success);
  }
}
