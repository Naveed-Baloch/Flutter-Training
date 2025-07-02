import 'package:flutter/foundation.dart';

/// SharedPrefs ->
/// Add Package
/// Create instance -> final prefs = await SharedPreferences.getInstance();
/// Set Value -> await prefs.setInt('counter', counter);
/// Read Value -> prefs.getInt('counter') ?? 0;
/// Remove value -> await prefs.remove('counter');