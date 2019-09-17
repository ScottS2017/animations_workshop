import 'package:animation_workshop/animations/animated_builder.dart';
import 'package:animation_workshop/animations/animated_widget.dart';
import 'package:animation_workshop/animations/basic_tween.dart';
import 'package:animation_workshop/animations/basic_tween_with_status_lisener.dart';
import 'package:animation_workshop/animations/examples_of_curves.dart';
import 'package:animation_workshop/animations/physics.dart';
import 'package:animation_workshop/animations/staggered_animations.dart';
import 'package:animation_workshop/routes_and_transitions/custom_route_transition_page_one.dart';
import 'package:animation_workshop/routes_and_transitions/fade_transition.dart';
import 'package:animation_workshop/routes_and_transitions/rotation_transition.dart';
import 'package:animation_workshop/routes_and_transitions/size_transition.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Scott Stoll'),
      accountEmail: Text('scottstoll2017@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('Basic Physics'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(1)),
        ),
        ListTile(
          title: Text('Basic Tween'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(2)),
        ),
        ListTile(
          title: Text('Animated Widget'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(3)),
        ),
        ListTile(
          title: Text('Basic Tween with Staus Listener'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(4)),
        ),
        ListTile(
          title: Text('Examples of Curves'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(5)),
        ),
        ListTile(
          title: Text('Animated Builder'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(6)),
        ),
        ListTile(
          title: Text('Fade Transition'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(7)),
        ),
        ListTile(
          title: Text('Rotation Transition'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(8)),
        ),
        ListTile(
          title: Text('Size Transition'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(9)),
        ),
        ListTile(
          title: Text('Staggered Animations'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(10)),
        ),
        ListTile(
          title: Text('Routes Transition Animations'),
          onTap: () => Navigator.of(context).push(_AnimationToShow(11)),
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Flutter Animations'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 32),
          child: Column(
            children: <Widget>[
              Spacer(flex: 1,),
              Expanded(
                flex: 5,
                child: Text(
                  'This is an example collection of some basic animations that are available in Flutter, designed as a teaching tool for talks and workshops.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              // Spacer(flex: 1,),
              Expanded(
                flex: 6,
                child: Text(
                  'Most of these examples will not trigger until you tap the screen, and some of them start slowly and smoothly, so be paitient if the animation takes a moment to start.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Spacer(flex: 1,),
              Expanded(
                flex: 6,
                child: Text(
                  'Swip or the click upper-left icon to open the navigation drawer and get started.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Spacer(flex: 1,),
            ],
          ),
        ),
        drawer: Drawer(
          child: drawerItems,
        ));
  }
}

// <Null> means this route returns nothing.
class _AnimationToShow extends MaterialPageRoute<Null> {
  final int _id;
  _AnimationToShow(this._id)
      : super(builder: (BuildContext context) {
          switch (_id) {
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
                return Container();
              }
          }
        });
}
