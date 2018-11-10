import 'package:animation_workshop/solution_files/basics/animations/staggered_animations.dart';
import 'package:animation_workshop/solution_files/basics/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StaggeredAnimationsPageTwo extends StatelessWidget {
  final Animation<double> controllerTwo;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<BorderRadius> borderRadius;

  StaggeredAnimationsPageTwo({
    Key key,
    this.controllerTwo,
  })  :

        // Each animation defined here transforms its value during the subset
        // of the controller's duration defined by the animation's interval.
        // For example the opacity animation transforms its value during
        // the first 10% of the controller's duration.

        opacity = Tween<double>(
          begin: 1.0,
          end: 0.2,
        ).animate(
          CurvedAnimation(
            parent: controllerTwo,
            curve: Interval(
              0.8,
              1.0,
              curve: Curves.ease,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 300.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: controllerTwo,
            curve: Interval(
              0.8,
              0.6,
              curve: Curves.ease,
            ),
          ),
        ),
        borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(75.0),
          end: BorderRadius.circular(4.0),
        ).animate(
          CurvedAnimation(
            parent: controllerTwo,
            curve: Interval(
              0.6,
              0.2,
              curve: Curves.ease,
            ),
          ),
        ),
        height = Tween<double>(
          begin: 300.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: controllerTwo,
            curve: Interval(
              0.3,
              0.0,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget _buildAnimationTwo(BuildContext context, Widget child) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.lightBlue[200],
              width: 3.0,
            ),
            borderRadius: borderRadius.value,
          ),
          child: FlutterLogo(
            size: 250.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimationTwo,
      animation: controllerTwo,
    );
  }
}

class StaggerDemoTwo extends StatefulWidget {
  @override
  _StaggerDemoTwoState createState() => _StaggerDemoTwoState();
}

class _StaggerDemoTwoState extends State<StaggerDemoTwo> with TickerProviderStateMixin {
  AnimationController _controllerTwo;
  bool directionIsForward = true;

  @override
  void initState() {
    super.initState();

    _controllerTwo = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);
  }

  Future<Null> _playAnimation(bool forward) async {
    try {
      print('Two is Starting');
      await _controllerTwo.forward().orCancel;
      print('Two is Done');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(
                model: SelectionsModel(),
              ),
        ),
      );

      /* if (forward) {
        await _controller.forward().orCancel;
      } else if (!forward) {
        await _controller.reverse().orCancel;
      }*/
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 is normal animation speed.
    return MaterialApp(
      title: 'Animations Workshop: Basics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animations Workshop: Basics'),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _playAnimation(directionIsForward);
            directionIsForward = !directionIsForward;
          },
          child: Container(
            color: Colors.grey[200],
            child: Center(
              child: StaggeredAnimation(controller: _controllerTwo.view),
            ),
          ),
        ),
      ),
    );
  }
}
