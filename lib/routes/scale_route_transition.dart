import 'package:flutter/material.dart';
class ScaleRouteTransition extends PageRouteBuilder {
  final Widget widget;
  ScaleRouteTransition({this.widget})
    : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return new ScaleTransition(
        scale: new Tween<double>(


          // Start and end sizes here. Play and have fun but
          // remember to use Hot Restart, not Hot Reload.
          begin: 3.0,
          end: 1.0,


        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(
              0.00,
              0.50,
              curve: Curves.linear,
            ),
          ),
        ),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 1.5,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.50,
                1.00,
                curve: Curves.linear,
              ),
            ),
          ),
          child: child,
        ),
      );
    }
  );
}