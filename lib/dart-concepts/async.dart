// void main() {
//   asyncFunction().then((value) => print(value));
// }

enum Status {
  Loading, Completed, Error
}

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


void main() async{
  print("Start");
  await getData();
  print("End");
}

Future<void> getData() async{
  String data = await middleFunction();
  print(data);
}

Future<String> middleFunction(){
  return Future.delayed(Duration(seconds:5), ()=> "Hello");
}