import 'dart:io';

import 'package:animation_workshop/basics/animations/rotation_transition.dart';
import 'package:animation_workshop/basics/animations/size_transition.dart';
import 'package:animation_workshop/routes/custom_route_transition_page_one.dart';
import 'package:animation_workshop/routes/custom_route_transition_page_two.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:animation_workshop/basics/animations/empty_screen.dart';
import 'package:animation_workshop/basics/animations/fade_transition.dart';
import 'package:animation_workshop/basics/animations/physics.dart';
import 'package:animation_workshop/basics/animations/staggered_animations.dart';
import 'package:animation_workshop/basics/animations/animated_builder.dart';
import 'package:animation_workshop/basics/animations/basic_tween.dart';
import 'package:animation_workshop/basics/animations/examples_of_curves.dart';
import 'package:animation_workshop/basics/animations/basic_tween_with_status_lisener.dart';
import 'package:animation_workshop/basics/animations/animated_widget.dart';

import 'package:scoped_model/scoped_model.dart';


void main() {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    /// Check the actual platform and set it accordingly.
    _setTargetPlatformForDesktop();
    runApp(MyApp(
        model: SelectionsModel(),
    ),
    );
}

void _setTargetPlatformForDesktop() {
    TargetPlatform targetPlatform;
    if (Platform.isMacOS) {
        targetPlatform = TargetPlatform.iOS;
    } else if (Platform.isLinux || Platform.isWindows) {
        targetPlatform = TargetPlatform.android;
    }
    if (targetPlatform != null) {
        debugDefaultTargetPlatformOverride = targetPlatform;
    }
}

class MyApp extends StatelessWidget {

    final SelectionsModel model;

    const MyApp({
        Key key,
        @required this.model
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return ScopedModel <SelectionsModel>(model: model,
            child: MaterialApp(
                title: 'Animations Workshop: Basics',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                ),
                home: Scaffold(
                    appBar: AppBar(
                        title: Text('Animations Workshop: Basics'),
                    ),
                    body: Column(
                        children: <Widget>[
                            LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
                                return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            minWidth: viewportConstraints.maxWidth,
                                        ),
                                        child: Container(
                                            color: Colors.white,
                                          child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                          right: 5.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Basic Physics'),
                                                          onPressed: () => model.selectedAnimation = 1,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 10.0,
                                                          right: 5.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Basic Tween'),
                                                          onPressed: () => model.selectedAnimation = 2,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                          right: 5.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('AnimatedWidget'),
                                                          onPressed: () => model.selectedAnimation = 3,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                          right: 5.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Status Listener'),
                                                          onPressed: () => model.selectedAnimation = 4,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                          right: 5.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Curve Samples'),
                                                          onPressed: () => model.selectedAnimation = 5,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                          right: 5.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('AnimatedBuilder'),
                                                          onPressed: () => model.selectedAnimation = 6,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                          right: 5.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Fade Transition'),
                                                          onPressed: () => model.selectedAnimation = 7,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                        right: 5.0,
                                                        top: 8.0,
                                                        bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Rotation Transition'),
                                                          onPressed: () => model.selectedAnimation = 8,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                        right: 5.0,
                                                        top: 8.0,
                                                        bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Size Transition'),
                                                          onPressed: () => model.selectedAnimation = 9,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                          right: 5.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Staggered Animation'),
                                                          onPressed: () => model.selectedAnimation = 10,
                                                      ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 5.0,
                                                        right: 5.0,
                                                        top: 8.0,
                                                        bottom: 8.0),
                                                      child: RaisedButton(
                                                          child: Text('Routes Transitions'),
                                                          onPressed: () => model.selectedAnimation = 11,
                                                      ),
                                                  ),
                                              ],
                                          ),
                                        ),
                                    ),
                                );
                            }),
                            Expanded(
                                flex: 1,
                                child: AnimationDisplay(),
                            ),
                        ],
                    ),
                ),
                routes: <String, WidgetBuilder>{
                    '/myNamedRoute': (BuildContext context) => RoutesTransitions2(),
                }
            ),
        );
    }
}

class AnimationDisplay extends StatefulWidget {
    AnimationDisplay({
        Key key,})
        : super(key: key);

    @override
    _AnimationDisplayState createState() => _AnimationDisplayState();
}

class _AnimationDisplayState extends State<AnimationDisplay> {

    @override
    Widget build(BuildContext context) {
        return ScopedModelDescendant<SelectionsModel>(
            builder: (context, child, model) {
                switch (model.selectedAnimation) {
                    case 1:
                        {
                            return PhysicsAnimation();
                        }
                        break;
                        case 2:
                        {
                            return BasicTween();
                        }
                        break;
                    case 3:
                        {
                            return AnimatedWidgetExample();
                        }
                        break;
                    case 4:
                        {
                            return BasicTweenWithStatusListener();
                        }
                        break;
                    case 5:
                        {
                            return ExamplesOfCurves();
                        }
                        break;
                    case 6:
                        {
                            return AnimatedBuilderExample();
                        }
                        break;
                    case 7:
                        {
                            return FadeTransitionExample();
                        }
                        break;
                    case 8:
                        {
                            return RotationTransitionExample();
                        }
                        break;
                    case 9:
                        {
                            return SizeTransitionDemo();
                        }
                        break;
                    case 10:
                        {
                            return StaggerDemo();
                        }
                        break;
                    case 11:
                        {
                            return RoutesTransitions();
                        }
                        break;
                    default:
                        {
                            return EmptyScreen();
                        }
                }
            },
        );
    }
}

class SelectionsModel extends Model {
    int _selectedAnimation = 0;

    int get selectedAnimation => _selectedAnimation;

    set selectedAnimation(int selection) {
        _selectedAnimation = selection;
        // Then notify all the listeners.
        notifyListeners();
    }
}
