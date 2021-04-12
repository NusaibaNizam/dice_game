import 'package:dice_game/dice_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsApp.debugAllowBannerOverride=false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber.shade900,
      ),
      home: DiceGame(),
    );
  }
}



