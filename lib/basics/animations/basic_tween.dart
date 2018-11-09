import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class BasicTween extends StatefulWidget {
    _BasicTweenState createState() => _BasicTweenState();
}

class _BasicTweenState extends State<BasicTween> with SingleTickerProviderStateMixin {
    Animation<double> animation;
    AnimationController controller;

    initState() {
        super.initState();
        controller = AnimationController(
            duration: const Duration(milliseconds: 2000), vsync: this);
        animation = Tween(begin: 0.0, end: 400.0).animate(controller)
            ..addListener(() {
                setState(() {
                    // the state that has changed here is the animation object’s value
                });
            });
        controller.forward();
    }

    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Center(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    height: animation.value,
                    width: animation.value,
                    child: FlutterLogo(),
                ),
            ),
        );
    }

    dispose() {
        controller.dispose();
        super.dispose();
    }
}