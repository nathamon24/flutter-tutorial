import 'package:cafepia/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isShow = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  isShow = pref.getBool('onBoarding') ?? true;
  runApp(const App());
}
