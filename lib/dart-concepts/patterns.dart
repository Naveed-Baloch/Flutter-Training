

void main() {
  patterns();
}

/// patterns
/// uses for Matching and destructure

typedef Users = List<String>;


void patterns() {
  const result = 1;
  switch (result) {
    case 1:
      {
        print("Case 1 executed");
        break;
      }
    case 2:
      {
        print("Case 2 executed");
        break;
      }
    default:
      {
        print("Default case executed");
        break;
      }
  }

  const  Users users = ["John", "Alice", "Bob"];
  var [first, sec, third] = users;
  print("First user: $first");
  print("Second user: $sec");
  print("Third user: $third");


}
