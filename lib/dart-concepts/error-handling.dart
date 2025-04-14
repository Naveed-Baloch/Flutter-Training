void main() {
  errorHandlingExample();
}

void errorHandlingExample() {
  try {
    throw FormatException('Expected at least 1 section');
  } on Exception catch (e) {
    // Handle the exception
    print('An error occurred: $e');
  } finally {
    print('Error handling example completed');
  }
}