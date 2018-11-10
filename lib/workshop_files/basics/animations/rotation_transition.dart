

//**********************************



import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart';

class RotationTransitionExample extends StatefulWidget {
    _RotationTransitionExampleState createState() => _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample> with SingleTickerProviderStateMixin {

    Animation animation;
    AnimationController _controller;

    initState() {
        super.initState();


        //**********************************



    }



    //**********************************




    Widget build(BuildContext context) {
        return GestureDetector(
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
        );
    }
}
