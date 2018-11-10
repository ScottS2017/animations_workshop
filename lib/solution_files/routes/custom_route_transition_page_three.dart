import 'package:animation_workshop/solution_files/basics/main.dart';
import 'package:animation_workshop/solution_files/routes/fade_route_transition.dart';
import 'package:flutter/material.dart';

class RoutesTransitions3 extends StatelessWidget {
  const RoutesTransitions3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes Transitions Page 3',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Routes Transitions Page 3'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  FadeRouteTransition(
                    widget: MyApp(
                      model: SelectionsModel(),
                    )),
                );
              },
              color: Colors.green,
              child: Text(
                'Hit Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
