void main() {
  HomeScreen homeScreen = HomeScreen("Home");
  homeScreen.initScreen();
  homeScreen.showScreen();
}

abstract class BaseScreen {
  abstract String title;
  void initScreen();

  void showScreen() {
    print("Showing the Screen Content");
  }
}

class HomeScreen extends BaseScreen {

  @override
  String title;
  HomeScreen(this.title);

  @override
  void initScreen() {
    print("Initializing the Screen Content");
  }

}