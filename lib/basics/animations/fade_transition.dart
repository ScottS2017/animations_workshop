import 'package:flutter/material.dart';

class FadeTransitionExample extends StatefulWidget {
    final String title;

    FadeTransitionExample({
        Key key,
        this.title})
        : super(key: key);

    @override
    _FadeTransitionExampleState createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample> {

    // The State of the object is initialized as visible
    bool _visible = true;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () {
// Make sure we call setState! This will tell Flutter to rebuild the
// UI with our changes!
                setState(() {

                    // Just toggle visible and rebuild the State object. The AnimatedOpacity handles the rest for you.
                    _visible = !_visible;
                });
            },
            child: Center(
                child: AnimatedOpacity(

                    // If the Widget should be visible, animate to 1.0 (fully visible). If
                    // the Widget should be hidden, animate to 0.0 (invisible).
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 2000),

                    // The green box needs to be the child of the AnimatedOpacity
                    child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: FlutterLogo(
                            size: 300.0,
                        ),
                    ),
                ),
            ),
        );
    }
}