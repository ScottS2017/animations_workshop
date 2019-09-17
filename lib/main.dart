import 'package:flutter/material.dart';
import 'package:animation_workshop/home.dart';

void main() {
    runApp(MyApp(),
    );
}

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Animations Workshop: Basics',
          theme: ThemeData(
              primarySwatch: Colors.blue,
          ),
          home: Home()
        );
    }
}