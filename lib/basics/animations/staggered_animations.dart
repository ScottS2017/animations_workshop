import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StaggeredAnimation extends StatelessWidget {

    final Animation<double> controller;
    final Animation<double> opacity;
    final Animation<double> width;
    final Animation<double> height;
    final Animation<BorderRadius> borderRadius;

    StaggeredAnimation({
        Key key,
        this.controller,})
        :

    // Each animation defined here transforms its value during the subset
    // of the controller's duration defined by the animation's interval.
    // For example the opacity animation transforms its value during
    // the first 10% of the controller's duration.

            opacity = Tween<double>(
                begin: 0.2,
                end: 1.0,
            ).animate(
                CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                        0.2, 0.8,
                        curve: Curves.ease,
                    ),
                ),
            ),
            width = Tween<double>(
                begin: 50.0,
                end: 300.0,
            ).animate(
                CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                        0.2, 0.4,
                        curve: Curves.ease,
                    ),
                ),
            ),
            borderRadius = BorderRadiusTween(
                begin: BorderRadius.circular(4.0),
                end: BorderRadius.circular(75.0),
            ).animate(
                CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                        0.4, 0.8,
                        curve: Curves.ease,
                    ),
                ),
            ),
            height = Tween<double>(
                begin: 50.0,
                end: 300.0,
            ).animate(
                CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                        0.8, 0.9,
                        curve: Curves.ease,
                    ),
                ),
            ),
            super(key: key);

    // This function is called each time the controller "ticks" a new frame.
    // When it runs, all of the animation's values will have been
    // updated to reflect the controller's current value.
    Widget _buildAnimation(BuildContext context, Widget child) {
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
            builder: _buildAnimation,
            animation: controller,
        );
    }
}

class StaggerDemo extends StatefulWidget {
    @override
    _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin {
    AnimationController _controller;
    bool directionIsForward = true;

    @override
    void initState() {
        super.initState();

        _controller = AnimationController(
            duration: const Duration(milliseconds: 2000),
            vsync: this
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

    @override
    Widget build(BuildContext context) {
        timeDilation = 1.0; // 1.0 is normal animation speed.
        print('Started the Staggered build method');
        return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
                _playAnimation(directionIsForward);
                directionIsForward = !directionIsForward;
            },
            child: Center(
                child: StaggeredAnimation(
                    controller: _controller.view
                ),
            ),
        );
    }
}
