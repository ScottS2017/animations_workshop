import 'package:animation_workshop/routes_and_transitions/custom_route_transition_page_three.dart';
import 'package:animation_workshop/routes_and_transitions/scale_route_transition.dart';

import 'package:flutter/material.dart';

class RoutesTransitions2 extends StatelessWidget {
  const RoutesTransitions2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes Transitions Page 2',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Routes Transitions Page 2'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  ScaleRouteTransition(widget: RoutesTransitions3()),
                );
              },
              color: Colors.red,
              child: Text(
                'That\'s it?\nHit Me!',
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