import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ObjectBeingAnimatedByAnimatedWidget extends AnimatedWidget {

    ObjectBeingAnimatedByAnimatedWidget({
        Key key,
        Animation<double> animation})
        : super(
        key: key,
        listenable: animation);

    Widget build(BuildContext context) {
        final Animation<double> animation = listenable;
        return Container(
            color: Colors.white,
          child: Center(
              child: Container(
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: animation.value,
                  width: animation.value,
                  child: FlutterLogo(),
              ),
          ),
        );
    }
}

class AnimatedWidgetExample extends StatefulWidget {
    _AnimatedWidgetExampleState createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample> with SingleTickerProviderStateMixin {
    AnimationController controller;
    Animation<double> animation;

    initState() {
        super.initState();
        controller = AnimationController(
            duration: const Duration(milliseconds: 2000), vsync: this);
        animation = Tween(begin: 0.0, end: 300.0).animate(controller);
        controller.forward();
    }

    Widget build(BuildContext context) {
        return ObjectBeingAnimatedByAnimatedWidget(animation: animation);
    }

    dispose() {
        controller.dispose();
        super.dispose();
    }
}