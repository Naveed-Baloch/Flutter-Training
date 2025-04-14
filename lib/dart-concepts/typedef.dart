typedef Users = List<String>;

void main() {
  defType();
}

void defType() {
  Users users = ["Naveed", "John", "Alice"];
  for (var user in users) {
    print('User: $user');
  }
}