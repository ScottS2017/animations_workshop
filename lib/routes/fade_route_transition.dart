import 'package:flutter/material.dart';
class FadeRouteTransition extends PageRouteBuilder {
  final Widget widget;
  FadeRouteTransition({this.widget})
    : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return new FadeTransition(
        opacity: new Tween<double>(
          begin: 0.0,
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
        child: FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.01,
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