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

        // Here is our simulation function that determines our final value
        _simulation = SimulationReplacesTicker();

        // Creates an animation controller with no upper
        // or lower bound for its value
        _controller = AnimationController.unbounded(

          // ALWAYS vsync
          vsync: this);

        // animateWith() returns _startSimulation(simulation);
        // so our animation started here in initState()
        // and is running
        _controller.animateWith(_simulation);
    }

    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Basic Physics'),
          ),
          body: Center(
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