import 'package:shared_preferences/shared_preferences.dart';

import 'networking/network/repo/post_repo.dart';

/// 1. Check Network Cache -> 'networking/network/repo/post_repo.dart'
/// 2. Shared_preference
void main() {
  sharedPreferenceExample();
}

const String isLoggedIn = "isLoggedIn";

void sharedPreferenceExample() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool(isLoggedIn, true);
  bool? isUserLoggedIn = sharedPreferences.getBool(isLoggedIn);
  if(isUserLoggedIn != null && isUserLoggedIn){
    print("User is logged in");
  }else{
    print("User is not logged in");
  }

}

