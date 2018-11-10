import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart';

class SizeTransitionDemo extends StatefulWidget {
  _SizeTransitionDemoState createState() => _SizeTransitionDemoState();
}

class _SizeTransitionDemoState extends State<SizeTransitionDemo> with SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController _controller;
  bool animationDirectionIsForward = true;

  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 3500
      ),
      vsync: this
    );

    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear
    );
  }


  Future<Null> _playAnimation(bool forward) async {
    try {
      if(forward) {
        await _controller
          .forward()
          .orCancel;
      } else if (!forward) {
        await _controller
          .reverse()
          .orCancel;
      }
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _playAnimation(animationDirectionIsForward);
        animationDirectionIsForward = !animationDirectionIsForward;
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: SizeTransition(
            sizeFactor: animation,
            axis: Axis.vertical,
            child: Center(
              child: Container(
                color: Colors.grey[200],
                child: FlutterLogo(
                  size: 300.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
