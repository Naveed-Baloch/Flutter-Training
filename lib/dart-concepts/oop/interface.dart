void main() {
  Game game = Game(name: "Classic");
  game.onGameStart();
  game.onGamePause();
  game.onGameResume();
  game.onGameEnd();
  game.onMessage();
  game.onNotification();
}

class Game implements GameListener, ChatListener {

  @override
  void onGamePause() {
    print('Game Pause');
  }

  @override
  void onGameResume() {
    print('Game Resume');
  }

  @override
  void onGameStart() {
    print('Game Start');
  }

  @override
  void onMessage() {
    print('Game OnMessage');
  }

  @override
  void onNotification() {
    print('Game OnNotification');
  }

  @override
  String name;

  Game({required this.name});

  @override
  void onGameEnd() {

  }
}

abstract class GameListener {
  late String name;
  void onGameStart();
  void onGamePause();
  void onGameResume();
  void onGameEnd() {
    print('Game End');
  }
}

abstract class ChatListener{
  void onMessage();
  void onNotification();
}