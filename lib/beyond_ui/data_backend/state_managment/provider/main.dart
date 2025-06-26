import 'package:flutter/foundation.dart';

/// Provider Key Concepts
/// 1. ChangeNotifier
///     Its a built-in flutter class which notify the its listeners about the change
///       extend the class with ChangeNotifier
/// 2. ChangeNotifierProvider
///     Provides the ChangeNotifier to Descendants/children
///     Wraps the ChangeNotifier & Widget to get the instance in children
///     Multi Providers
///       We can provide the multi providers to descendants
/// 3. Consumer
///     We can access the ChangeNotifier to use the data using Consumer
/// 4. Provider.of
///     Is used for accessing the ChangeNotifier in non Widgets
///     Provider.of<MyModel>(context, listen: false);
/// 5. Selector Provider
///     Helps us with listening to specify State/Change instead of whole object
/// 6. ProxyProvider
///     With ProxyProvider We can inject the a Provider value to the other Provider
///     We can create new provider who values are dependent on other provider
///     We can provide the a single Provider to other provider

void main() {}

