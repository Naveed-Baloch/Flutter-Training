void main() {
  Game game = Game();
  game.onGameStart();
  game.onGamePause();
  game.onGameResume();
  game.onGameEnd();
  game.onMessage();
  game.onNotification();
}

class Game implements GameListener, ChatListener {
  @override
  void onGameEnd() {
    print('Game End');
  }

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
}

abstract class GameListener {
  void onGameStart();
  void onGamePause();
  void onGameResume();
  void onGameEnd();
}

abstract class ChatListener{
  void onMessage();
  void onNotification();
}