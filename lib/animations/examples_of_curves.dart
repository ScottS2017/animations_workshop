import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ExamplesOfCurves extends StatefulWidget {
  @override
  ExamplesOfCurvesState createState() => ExamplesOfCurvesState();
}

// Take a look at TickerProviderStateMixin as opposed to SingleTickerProviderStateMixin
class ExamplesOfCurvesState extends State<ExamplesOfCurves> with TickerProviderStateMixin {
  //
  AnimationController _controller;
  int currentCurve = 0;
  Curve useThisCurve = Curves.ease;
  String curveType = '';

  @override
  void initState() {
    super.initState();

    // Duration is the total duration of all transitions, expressed in time.
    _controller = AnimationController(
      duration: Duration(milliseconds: 3000),

      // Vsync is a must, it ensures that each frame that is processed corresponds to a frame that is actually rendered on the screen.
      vsync: this,
    );
  }

  /// Take a bag and always clean up after your dog.
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future _startAnimation() async {
    try {
      selectCurve();
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  void selectCurve() {
    setState(() {
      currentCurve >= 0 && currentCurve <= 4 ? currentCurve++ : currentCurve = 1;
      switch (currentCurve) {
        case 1:
          {
            curveType = 'Curves.ease';
            useThisCurve = Curves.ease;
          }
          break;
        case 2:
          {
            curveType = 'Curves.bounceInOut';
            useThisCurve = Curves.bounceInOut;
          }
          break;
        case 3:
          {
            curveType = 'Curves.elasticInOut';
            useThisCurve = Curves.elasticInOut;
          }
          break;
        case 4:
          {
            curveType = 'Curves.fastOutSlowIn';
            useThisCurve = Curves.fastOutSlowIn;
          }
          break;
        case 5:
          {
            curveType = 'Curves.decelerate';
            useThisCurve = Curves.decelerate;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ///*************************************************************************
    /// timeDilation slows down animations by this factor to help in development.
    timeDilation = 1.0;

    ///*************************************************************************

    return Scaffold(
      appBar: AppBar(
        title: Text('Examples of Curves'),
      ),
      body: GestureDetector(
        onTap: () {
          _startAnimation();
        },
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 1,),
              Text(
                curveType,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(flex: 1,),
              Container(
                width: 350.0,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.blueGrey.withOpacity(0.8),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    AnimatedBox(
                      currentCurve: useThisCurve,
                      controller: _controller,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              ' Start',
                              style: TextStyle(
                                fontSize: 36.0,
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Row(
                          children: <Widget>[
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              'End ',
                              style: TextStyle(
                                fontSize: 36.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedBox extends StatelessWidget {
  final Animation<double> controller;
  final Animation<Alignment> movement;
  final Curve currentCurve;
  static final double movementStart = 0.1;
  static final double movementEnd = 0.9;

  AnimatedBox({Key key, this.controller, this.currentCurve})
      : movement = AlignmentTween(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              movementStart,
              movementEnd,
              curve: currentCurve,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Align(
              alignment: movement.value,
              child: FlutterLogo(
                size: 100.0,
              ),
            );
          },
        );
      },
    );
  }
}
