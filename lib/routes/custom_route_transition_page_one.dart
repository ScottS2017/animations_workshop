/// Credit to Agung Surya for his article "Create Custom Router
/// Transition in Flutter using PageRouteBuilder"
///
/// You can find it at:
/// https://medium.com/@agungsurya/create-custom-router-transition-in-flutter-using-pageroutebuilder-73a1a9c4a171


import 'package:animation_workshop/routes/custom_route_transition_page_two.dart';
import 'package:flutter/material.dart';

class RoutesTransitions extends StatelessWidget {
  const RoutesTransitions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return RoutesTransitions2();
                },
                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                  return SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: new SlideTransition(
                      position: new Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(-1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
          color: Colors.lightBlue,
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
    );
  }
}