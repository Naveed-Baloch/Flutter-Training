void main() {
  loops();
}

typedef Users = List<String>;
void loops() {
  const users = ["a", "b", "c"];
  // Simple For Loop
  for (var i = 0; i < users.length; i++) {
    if(i==0) continue;
    print(users[i]);
  }

  print("____________");
  // Advanced Loop
  for (var user in users) {
    print(user);
  }

}