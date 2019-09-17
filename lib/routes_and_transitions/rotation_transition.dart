import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart';

// **************************************************************
// **************************************************************
// **************************************************************
//                  DO STUFF HERE
// **************************************************************
// **************************************************************
// **************************************************************

class RotationTransitionExample extends StatefulWidget {
  _RotationTransitionExampleState createState() => _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController _controller;

  initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 3500), vsync: this);

    animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);
  }

  Future _startAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
    _controller.reset();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotations Transition'),
      ),
      body: GestureDetector(
        onTap: () {
          _startAnimation();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: RotationTransition(
              turns: animation,
              alignment: Alignment.center,
              child: Center(
                child: Container(
                  child: FlutterLogo(
                    size: 300.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
