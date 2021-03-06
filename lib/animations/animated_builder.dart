import 'package:flutter/material.dart';

// **************************************************************
// **************************************************************
// **************************************************************
//                  DO STUFF HERE
// **************************************************************
// **************************************************************
// **************************************************************

class ObjectBeingAnimatedByAnimatedBuilder extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  final bool showExpandeds = false;

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: showExpandeds == false ? Colors.white : Colors.black,
                  height: 150.0,
                ),
              ),
              CustomAnimatedBuilder(animation: animation, child: child),
              Expanded(
                child: Container(
                  color: showExpandeds == false ? Colors.white : Colors.black,
                  height: 150.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: showExpandeds == false ? Colors.white : Colors.black,
              height: 150.0,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    CustomAnimatedBuilder(animation: animation, child: child),
                    Expanded(
                      child: Container(
                        color: showExpandeds == false ? Colors.white : Colors.black,
                        height: 150.0,
                      ),
                    ),
                  ],
                ),
              ),
              CustomAnimatedBuilder(animation: animation, child: child),
            ],
          ),
          Expanded(
            child: Container(
              color: showExpandeds == false ? Colors.white : Colors.black,
              height: 150.0,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: showExpandeds == false ? Colors.white : Colors.black,
                  height: 150.0,
                ),
              ),
              CustomAnimatedBuilder(animation: animation, child: child),
              Expanded(
                child: Container(
                  color: showExpandeds == false ? Colors.white : Colors.black,
                  height: 150.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAnimatedBuilder extends StatelessWidget {
  const CustomAnimatedBuilder({
    Key key,
    @required this.animation,
    @required this.child,
  }) : super(key: key);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          height: animation.value,
          width: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(
          milliseconds: 2000,
        ),
        vsync: this);

    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation = Tween(begin: 0.0, end: 150.0).animate(curve);

    controller.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physics Animation'),
      ),
      body: GrowTransition(child: ObjectBeingAnimatedByAnimatedBuilder(), animation: animation),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
