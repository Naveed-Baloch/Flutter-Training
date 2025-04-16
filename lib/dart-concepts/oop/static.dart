void main() {
  var url = BaseScreen.appUrl;
  print(url);
  BaseScreen.printAppUrl();
}

class BaseScreen {
  static String appUrl = "https://example.com";

  static void printAppUrl() {
    print(appUrl);
  }
}