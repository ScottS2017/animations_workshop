import 'package:flutter/material.dart';

import 'package:animation_workshop/main.dart';
import 'package:animation_workshop/routes_and_transitions/fade_route_transition.dart';
import 'package:animation_workshop/models/selection_model.dart';

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
                    )),
                );
              },
              color: Colors.green,
              child: Text(
                'Whatever, just go home...',
                textAlign: TextAlign.center,
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
