void main() {
  print(Status.running.name);
  print(Status.running.toText());
}

enum Status {
  none,
  running,
  stopped,
  paused;

  String toText() => switch (this) {
    Status.none => "None",
    Status.running => "Running",
    Status.stopped => "Stopped",
    Status.paused => "Paused",
  };
}
