import 'package:flutter/material.dart';

class PhysicsAnimation extends StatefulWidget {
    @override
    PhysicsAnimationState createState() {
        return new PhysicsAnimationState();
    }
}

class PhysicsAnimationState extends State<PhysicsAnimation> with SingleTickerProviderStateMixin {

    AnimationController _controller;
    SimulationReplacesTicker _simulation;

    @override
    initState() {
        super.initState();
        _simulation = SimulationReplacesTicker();
        _controller = AnimationController.unbounded(vsync: this);
        _controller.animateWith(_simulation);
    }

    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
        return Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                  return Transform.scale(
                      scale: _controller.value,
                      child: child,
                  );
              },
              child: FlutterLogo(
                  size: 400.0,
              )
              ),
        );
    }
}

class SimulationReplacesTicker extends Simulation {
    @override
    double x(double time) {
        if((time % 2.0) > 1.0){
            return 1.0 - (time % 1.0);
        }else{
            return time % 1.0;
        }
    }

    @override
    double dx(double time)  => 1.0;

    @override
    bool isDone(double time)  => false;
}