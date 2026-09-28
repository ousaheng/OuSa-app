import 'package:flutter/material.dart';
import 'package:ousa/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // 1 Make sure flutter is ready to start
  WidgetsFlutterBinding.ensureInitialized();
  //2 Prepare the wall for our sticky notes
  final prefs = await SharedPreferences.getInstance();
  
  runApp(const App());
}
