sealed class Result<T> {
  const Result();
}

class Loading<T> extends Result<T> {}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String? message;

  const Failure(this.message);
}

void main() {
  Result<List<int>> result = Loading();
  switch (result) {
    case Loading():
      print('Loading');
      break;
    case Success():
      print('Success: ${result.data}');
      break;
    case Failure():
      print('Failure: ${result.message}');
      break;
  }
}