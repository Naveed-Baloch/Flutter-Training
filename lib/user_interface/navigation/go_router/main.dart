import 'package:flutter/material.dart';
import 'package:flutter_training/user_interface/navigation/go_router/screens/screen3.dart';
import 'package:flutter_training/user_interface/navigation/go_router/typed_routes.dart';

/// Step1:  Define Router
/// Step2:  Use the Router
/// Step3:  Passing Data b/w Screens
///         1. using Query Params
///         2. using Extras
///         3. using path params
/// Step4: Returning data back
/// Step5: Adding Child Routes in Single Route
/// Step6: Nested Tab Navigation
///         1. We can use the section of the screen
///         2. Group the Similar Nested Routes with Each Other
/// Step7: Redirection in Go-Router
///         1. If the User is not logged in then redirect to Login Screen
void main() {
  runApp(MaterialApp.router(routerConfig: typedRouter));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate using type-safe approach
                const Screen1Route().go(context);
              },
              child: const Text('Go to First Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate using type-safe approach
                const Screen2Route().go(context);
              },
              child: const Text('Go to Second Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navigate using type-safe approach with string parameters
                final result = await Screen3Route(name: "Go router",
                  description: 'Data received',
                ).push<Screen3Data>(context);

                if (result != null) {
                  print(result.name);
                  print(result.description);
                }
              },
              child: const Text('Go to Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
