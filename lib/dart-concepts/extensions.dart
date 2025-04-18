void main() {
  print('hello world'.capitalize);
  const status = Status.none;
  print(status.isRunning);

}

extension on String {
  String get capitalize => this.toUpperCase();



}

enum Status {
  none,
  running,
  stopped,
  paused
}

extension on Status {
  bool get isRunning => this == Status.running;
}