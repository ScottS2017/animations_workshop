import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


// **************************************************************
// **************************************************************
// **************************************************************
//                  DO STUFF HERE
// **************************************************************
// **************************************************************
// **************************************************************



class BasicTweenWithStatusListener extends StatefulWidget {
  _BasicTweenWithStatusListenerState createState() => _BasicTweenWithStatusListenerState();
}

class _BasicTweenWithStatusListenerState extends State<BasicTweenWithStatusListener> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 400.0).animate(controller)

      /// It’s often helpful to know when an animation changes state,
      /// such as finishing, moving forward, or reversing. You can get
      /// notifications for this with addStatusListener(). The following
      /// code listens for a state change and prints an update.

      ..addStatusListener((state) => print("$state"))

      /// And this uses the StatusListener to trigger the animation forward or in reversed.
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addListener(() {
        setState(() {
        });
      });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
